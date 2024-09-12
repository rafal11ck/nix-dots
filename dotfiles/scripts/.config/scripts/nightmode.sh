#!/bin/sh

toggle()
{
    pkill gammastep >/dev/null 2>&1 || setsid -f gammastep -O 3700 >/dev/null 2>&1
    pkill -RTMIN+9 waybar
}

status()
{
  if pgrep gammastep >/dev/null; then
    alt="on"
    tooltip="deactivate nightmode"
    class="activated"
  else
    alt="off"
    tooltip="activate nightmode"
  fi
  echo "{ \"alt\" : \"$alt\", \"tooltip\" : \"$tooltip\", \"class\" : \"$class\" }"
}


help()
{
echo "Usage:
     --status   get status in json
     --toggle   toggle
     --help     show this message
"
}

# Ensure only one flag is passed
[ $# -ge 2 ] && (help ; exit)

case "$1" in
  "--status")
    status
    ;;
  "--toggle")
    toggle
    ;;
  "--help" | *)
    help
    exit
    ;;
esac
