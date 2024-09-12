#!/usr/bin/env sh
set -xe

cd "$HOME/.config/jellyfin-mpv-shim"
cp "$(fd -e json . cred | fzf)" cred.json
pkill -f python.*jellyfin-mpv-shim || true
setsid -f 'jellyfin-mpv-shim' 2>&1 > /dev/null  
