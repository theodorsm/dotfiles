#! /bin/bash

setxkbmap eu &

# Terminate already running bar instances
killall polybar &

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

monitors=$(xrandr)
if echo $monitors | grep "DP1 connected" && echo $monitors | grep "DP2 connected"; then
    ~/.screenlayout/home_setup.sh &
    sleep 2 &
    polybar secondary -c /home/$USER/.config/polybar/config &
    polybar side -c /home/$USER/.config/polybar/config &
    xrandr --output DP1 --mode 2560x1440 --rate 143.86
elif echo $monitors | grep "connected 2560x1440"; then
    polybar main -c /home/$USER/.config/polybar/config &
    polybar secondary -c /home/$USER/.config/polybar/config &
elif echo $monitors | grep "DP1 connected 1920x1200"; then
    polybar main -c /home/$USER/.config/polybar/config &
    polybar secondary -c /home/$USER/.config/polybar/config &
elif echo $monitors | grep "DP1 connected 1920x1080"; then
    ~/.screenlayout/1080p_top.sh &
    sleep 2 &
    polybar main -c /home/$USER/.config/polybar/config &
    polybar secondary -c /home/$USER/.config/polybar/config &
else
    polybar main -c /home/$USER/.config/polybar/config &
fi &

feh --bg-fill ~/Pictures/deskmat.png &
nm-applet &
dropbox &
picom -b &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' '' &

# fix java stuff
wmname LG3D &

# keyrepeat
xset r rate 200 40 &

# touchpad
xinput set-prop 11 "libinput Tapping Enabled" 1
if xinput --list | grep "Logitech"; then
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 0
else
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 1
    xinput set-prop 14 "libinput Natural Scrolling Enabled" 1
    xinput set-prop 14 "libinput Tapping Enabled" 1
fi
