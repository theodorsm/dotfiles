#! /bin/bash

setxkbmap eu &
feh --bg-scale ~/Pictures/moon.jpg

# second monitor setup
monitors=$(xrandr --listactivemonitors)
if [echo $monitors | grep "1440"] && [echo $monitors | "DP1"]
then
    xrandr --output DP1 --mode 2560x1440 --rate 143.86
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal --output DP1 --mode 2560x1440 --pos 0x0 --rotate normal
elif [echo $monitors | grep "1440"] && [echo $monitors | "DP2"]
then
    xrandr --output DP2 --mode 2560x1440 --rate 143.86
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal --output DP2 --mode 2560x1440 --pos 0x0 --rotate normal
fi

~/.config/polybar/launch.sh &
compton &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' '' &

# fix java stuff
wmname LG3D &

# keyrepeat
xset r rate 200 40 &

# touchpad
xinput set-prop 11 "libinput Tapping Enabled" 1 &
if xinput --list | grep "SABRE"; then
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 0
else
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 1
fi &


