# tablet as second monitor via usb

headless_rm() {
    set -x
    pgrep -af "wayvnc" && killall wayvnc
    headless=$(hyprctl monitors | sed -nE 's|.*(HEADLESS-[0-9]*).*|\1|p')
    hyprctl output remove "$headless"
    unset headless
    set +x
}


headless_add() {
    set -x
    #define ur preferred port
    PORT="11000"

    # check existing headless display
    headless=$(hyprctl monitors | sed -nE 's|.*(HEADLESS-[0-9]*).*|\1|p')

    #create, if not exists
    [ -z "$headless" ] && hyprctl output create headless | grep -q "ok" && headless=$(hyprctl monitors | sed -nE 's|.*(HEADLESS-[0-9]*).*|\1|p') && printf '\n\nCreate Headless Display: %s' "$headless"

    #there is issue
    [ -z "$headless" ] && printf "Something went wrong\n" && return 1

    #check for android devices, and select which one u wanna work upon
    device=$(adb devices | sed '/^\*/d;/^List of devices/d;/^$/d' | cut -f1 | fzf --prompt="Select Device > " -1)

    #throw issue if no android has been there
    [ -z "$device" ] && printf "Unable to detect Android using ADB" && return 1

    #select device resolution and fps
    RES=$(adb -s "$device" shell dumpsys display | sed -nE 's|^[[:space:]]*DisplayModeRecord.*width=([0-9]*), height=([0-9]*), fps=([0-9\.]*).*|\2x\1@\3|p' | fzf --prompt="Select Resolution > " -1)

    #device fps for wayvnc
    device_fps=$(printf '%s' "$RES" | cut -d'@' -f2)

    #Position of moniotr
    monitor_position=$(printf "auto\nauto-right\nauto-left\nauto-up\nauto-down" | fzf --prompt="Select positioning > ")

    # set resolution,fps,scaling and positoning
    hyprctl keyword monitor "$headless","$RES","$monitor_position",auto

    # kill existing wayvnc and start a new one
    pgrep -af "wayvnc" && killall wayvnc
    setsid -f wayvnc --output="$headless" --max-fps="$device_fps" 0.0.0.0 $PORT

    #reverse port forward to device, and start VNC
    adb -s "$device" reverse tcp:$PORT tcp:$PORT
    adb -s "$device" shell am start --user 0 -a android.intent.action.VIEW -d "vnc://127.0.0.1:$PORT"

    setsid -f tail -0f /tmp/adb.1000.log | while read -r line;do
        printf '%s' "$line" | grep -q "$device: connection terminated" && headless_rm && break #use a function or add ur logic
    done

    #cleanup
    unset PORT headless RES
    set +x
}


headless_add