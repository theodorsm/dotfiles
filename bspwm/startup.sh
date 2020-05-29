#! /bin/bash
setxkbmap eu &
feh --bg-scale ~/Pictures/vibrant_smoke.png &
~/.config/polybar/launch.sh &
compton &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' '' &
#fix java stuff
wmname LG3D &
#keyrepeat
xset r rate 200 40 &
#touchpad
xinput set-prop 11 "libinput Tapping Enabled" 1 &
xinput set-prop 11 "libinput Natural Scrolling Enabled" 1 &
#100hz second monitor
xrandr --output DP-1 --mode 2560x1440 --rate 99.95 &

