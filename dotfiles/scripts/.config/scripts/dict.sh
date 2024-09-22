#!/usr/bin/env sh
#dict wrapper wayland

dict "$(wl-paste -p)" 2>&1 | less
