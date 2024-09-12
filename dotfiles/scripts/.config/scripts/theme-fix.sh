#!/bin/sh

#export QT_QPA_PLATFORMTHEME=qt6ct
export GTK_THEME=Pop-dark

(gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark > /dev/null 2>&1 &&
     gsettings set org.gnome.desktop.interface gtk-theme Pop-dark > /dev/null 2>&1) || notify-send "$0" "Settiing theme failed"
