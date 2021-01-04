#! /bin/bash

setxkbmap eu &

# ====POLYBAR====

# Terminate already running bar instances
killall polybar &

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done &

 Second monitor setup
#~/.config/polybar/launch.sh &
monitors=$(xrandr --listactivemonitors)
if echo $monitors | grep "1440" && echo $monitors | grep "DP2"; then
  polybar secondary -c /home/$USER/.config/polybar/config &
  polybar side -c /home/$USER/.config/polybar/config &
elif echo $monitors | grep "1440" && echo $monitors != "*DP2*"; then
  polybar main -c /home/$USER/.config/polybar/config &
  polybar secondary -c /home/$USER/.config/polybar/config &
elif echo $monitors != "*DP1*" && echo $monitors != "*DP2*"; then
  polybar secondary -c /home/$USER/.config/polybar/config &
  polybar main -c /home/$USER/.config/polybar/config &
fi &

picom -b &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' '' &
nm-applet &
feh --bg-fill ~/Pictures/deskmat.png &

# fix java stuff
wmname LG3D &

# keyrepeat
xset r rate 200 40 &

# touchpad
xinput set-prop 11 "libinput Tapping Enabled" 1 &
if xinput --list | grep "Logitech"; then
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 0
else
    xinput set-prop 11 "libinput Natural Scrolling Enabled" 1
fi &
