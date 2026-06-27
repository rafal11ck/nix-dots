#!/usr/bin/env bash
#
# Transkrypcja pliku audio przez whisper.cpp na GPU (Vulkan) z VAD.
# Użycie: transcribe.sh PLIK_AUDIO [JEZYK]
#   PLIK_AUDIO - dowolny format obsługiwany przez ffmpeg (m4a, mp3, wav, ...)
#   JEZYK      - kod języka dla whispera (domyślnie: pl)
# Wynik: PLIK_AUDIO bez rozszerzenia + .txt, obok pliku wejściowego.

set -euo pipefail

MODELS_DIR="${WHISPER_MODELS_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/whisper}"
MODEL="${WHISPER_MODEL:-$MODELS_DIR/ggml-large-v3.bin}"
VAD_MODEL="${WHISPER_VAD_MODEL:-$MODELS_DIR/ggml-silero-v5.1.2.bin}"
VAD_URL="https://huggingface.co/ggml-org/whisper-vad/resolve/main/ggml-silero-v5.1.2.bin"

for cmd in whisper-cli ffmpeg; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        printf '%s\n' "Brak wymaganego polecenia: $cmd" >&2
        exit 1
    fi
done

input="${1:-}"
lang="${2:-pl}"
if [ -z "$input" ] || [ ! -f "$input" ]; then
    printf '%s\n' "Użycie: ${0##*/} PLIK_AUDIO [JEZYK]" >&2
    exit 1
fi

# Modele pobierz raz, jeśli ich nie ma.
if [ ! -f "$MODEL" ]; then
    printf '%s\n' "Pobieram model whisper (large-v3) do $MODELS_DIR ..." >&2
    mkdir -p "$MODELS_DIR"
    whisper-cpp-download-ggml-model large-v3 "$MODELS_DIR/"
fi
if [ ! -f "$VAD_MODEL" ]; then
    printf '%s\n' "Pobieram model VAD (silero) do $MODELS_DIR ..." >&2
    mkdir -p "$MODELS_DIR"
    curl -L -o "$VAD_MODEL" "$VAD_URL"
fi

# Tymczasowy WAV 16 kHz mono (whisper.cpp tego wymaga); sprzątany na wyjściu.
wav="$(mktemp --suffix=.wav)"
trap 'rm -f "$wav"' EXIT

ffmpeg -y -loglevel error -i "$input" -ar 16000 -ac 1 -c:a pcm_s16le "$wav"

# -mc (max-context): ograniczony kontekst utrudnia zapętlenie dekodera,
# zachowując kontekst lokalny dla dobrej pisowni. 0 = brak pętli, ale gorsze słowa.
# WHISPER_PROMPT - opcjonalna podpowiedź słownictwa/kontekstu (np. terminy medyczne).
args=(
    -m "$MODEL"
    -f "$wav"
    -l "$lang"
    -dev 0
    -t "$(nproc)"
    --vad --vad-model "$VAD_MODEL"
    -mc "${WHISPER_MAX_CONTEXT:-64}"
    -otxt -of "${input%.*}"
)
[ -n "${WHISPER_PROMPT:-}" ] && args+=(--prompt "$WHISPER_PROMPT")

whisper-cli "${args[@]}"

printf '%s\n' "Gotowe: ${input%.*}.txt"
