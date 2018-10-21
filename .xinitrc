xmodmap ~/.xmodmap &
xbindkeys &
google-chrome-stable &
~/.config/i3/polybar.sh &
compton --config ~/.config/compton.conf &
setxkbmap us -variant colemak &
xinput --set-prop 13 'libinput Accel Speed' -0.5 &

#from pywal
# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
# wal -R
~/.config/wal/wallpaper.sh &


exec i3
