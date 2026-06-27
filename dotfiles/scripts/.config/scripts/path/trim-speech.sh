#!/usr/bin/env bash
#
# Wycina z audio tylko fragmenty z MOWĄ (VAD silero), usuwając przerwy
# z samym tłem/krokami/ciszą. Skraca długie nagranie do samych wypowiedzi.
# Użycie: trim-speech.sh PLIK_AUDIO [PLIK_WYJSCIOWY]
# Wynik domyślnie: <plik>_speech.m4a obok wejścia.

set -euo pipefail

MODELS_DIR="${WHISPER_MODELS_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/whisper}"
VAD_MODEL="${WHISPER_VAD_MODEL:-$MODELS_DIR/ggml-silero-v5.1.2.bin}"
VAD_URL="https://huggingface.co/ggml-org/whisper-vad/resolve/main/ggml-silero-v5.1.2.bin"
PAD="${SPEECH_PAD:-0.15}"   # padding dodawany wokół każdego segmentu mowy (s)
GAP="${SPEECH_GAP:-0.4}"    # segmenty bliżej niż tyle sekund są scalane

for cmd in whisper-vad-speech-segments ffmpeg python3; do
    command -v "$cmd" >/dev/null 2>&1 || { printf '%s\n' "Brak wymaganego polecenia: $cmd" >&2; exit 1; }
done

input="${1:-}"
if [ -z "$input" ] || [ ! -f "$input" ]; then
    printf '%s\n' "Użycie: ${0##*/} PLIK_AUDIO [PLIK_WYJSCIOWY]" >&2
    exit 1
fi
output="${2:-${input%.*}_speech.m4a}"

if [ ! -f "$VAD_MODEL" ]; then
    printf '%s\n' "Pobieram model VAD (silero) do $MODELS_DIR ..." >&2
    mkdir -p "$MODELS_DIR"
    curl -L -o "$VAD_MODEL" "$VAD_URL"
fi

wav="$(mktemp --suffix=.wav)"
segs="$(mktemp)"
list="$(mktemp)"
trap 'rm -f "$wav" "$segs" "$list"' EXIT

# whisper.cpp VAD wymaga WAV 16 kHz mono.
ffmpeg -y -loglevel error -i "$input" -ar 16000 -ac 1 -c:a pcm_s16le "$wav"

# Wykryj segmenty mowy (CPU; padding i min. cisza dobrane pod naturalne cięcia).
whisper-vad-speech-segments -f "$wav" -vm "$VAD_MODEL" -t "$(nproc)" \
    --no-prints -vp 200 -vsd 300 > "$segs"

# Z segmentów (setne sekundy) zbuduj listę concat: padding + scalanie bliskich.
python3 - "$input" "$segs" "$list" "$PAD" "$GAP" <<'PY'
import re, os, sys
src, segfile, listfile, pad, gap = sys.argv[1], sys.argv[2], sys.argv[3], float(sys.argv[4]), float(sys.argv[5])
segs = []
for line in open(segfile):
    m = re.search(r'start = ([\d.]+), end = ([\d.]+)', line)
    if m:
        segs.append([float(m.group(1)) / 100.0, float(m.group(2)) / 100.0])
merged = []
for s, e in segs:
    s = max(0, s - pad); e = e + pad
    if merged and s <= merged[-1][1] + gap:
        merged[-1][1] = max(merged[-1][1], e)
    else:
        merged.append([s, e])
src = os.path.abspath(src)
with open(listfile, 'w') as f:
    for s, e in merged:
        f.write("file '%s'\ninpoint %.2f\noutpoint %.2f\n" % (src, s, e))
print("segmentów mowy: %d, łącznie %.1f min" % (len(merged), sum(e - s for s, e in merged) / 60), file=sys.stderr)
PY

ffmpeg -y -loglevel error -f concat -safe 0 -i "$list" -c:a aac -b:a 128k "$output"
printf '%s\n' "Gotowe: $output"
