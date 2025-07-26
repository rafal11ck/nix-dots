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

OCRLANG="$(tesseract --list-langs | tail +2 | tofi)" grim -g "$(slurp)" - | tesseract -l "$OCRLANG" stdin stdout | wl-copy