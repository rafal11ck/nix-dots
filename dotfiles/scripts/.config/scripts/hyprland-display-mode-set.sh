#!/usr/bin/env sh

set -xe

display="$(hyprctl monitors -j | jq -r .[].name | fzf --prompt 'Select monitor')"

mode="$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$display\").availableModes | @sh" | tr ' ' '\n' | tr -d \' | fzf --prompt 'Select mode')"

hyprctl keyword monitor "$display","$mode",auto,1
