#! /bin/bash

setxkbmap eu &
feh --bg-scale ~/Pictures/mountains_fog_sky_116917_3840x2160.jpg &

# second monitor setup
if xrandr --listactivemonitors | grep "1440"; then
    xrandr --output DP-1 --mode 2560x1440 --rate 99.95
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal --output DP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
fi &

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


