#!/usr/bin/env sh
# select area, then language read text from image and put it in clipboard

set -xeu

# check for dependencies
for cmd in tesseract tofi grim slurp; do
    if ! command -v "$cmd" &>/dev/null; then
        notify-send  -e "OCR dependencies are missing" "Missing command: $cmd in script $0"
        exit 1
    fi
done


ocrlang=$(tesseract --list-langs | tail -n+2 | tr '\\n' '+' | sed 's/+$//') grim -g "$(slurp)" - | tesseract -l "$ocrlang" stdin stdout | wl-copy