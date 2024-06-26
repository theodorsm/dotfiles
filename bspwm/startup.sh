#! /bin/bash

setxkbmap eu -option "ctrl:swapcaps" &

# Terminate already running bar instances
killall polybar &

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

monitors=$(xrandr)
if echo $monitors | grep "DP-1 connected" && echo $monitors | grep "DP-2 connected"; then
	sleep 2 &
	~/.screenlayout/home_setup.sh &
	sleep 2 &
	polybar secondary -c /home/$USER/.config/polybar/config &
	polybar side -c /home/$USER/.config/polybar/config &
elif echo $monitors | awk "/connected/ && /2560x1440/"; then
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
picom -b &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' '' &
nm-applet &
dropbox &

# fix java stuff
wmname LG3D &

dunst &

xrdb -merge .Xresources &

unset QT_STYLE_OVERRIDE &

# keyrepeat
xset r rate 200 40 &

# touchpad
xinput set-prop 12 "libinput Tapping Enabled" 1
if xinput --list | grep "Logitech"; then
	xinput set-prop 11 "libinput Natural Scrolling Enabled" 0
else
	xinput set-prop 10 "libinput Natural Scrolling Enabled" 1
	xinput set-prop 10 "libinput Tapping Enabled" 1
	xinput set-prop 11 "libinput Natural Scrolling Enabled" 1
	xinput set-prop 11 "libinput Tapping Enabled" 1
	xinput set-prop 12 "libinput Natural Scrolling Enabled" 1
	xinput set-prop 12 "libinput Tapping Enabled" 1
fi
