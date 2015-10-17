#!/bin/sh

xsetroot -cursor_name left_ptr 	# set cursor
#xsetroot -grey      	        # set background
#xmobar &			# start xmobar
xbacklight -set 25		# lower screen brightness

ponymix set-balance 0		# set volume (25%, balanced)
ponymix set-volume 25

### Xresources ################################################################
# Load Xresoures with xrdb, solarized theme
# loading xresources in xrdb is not recommended
# xrdb ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#wallpaper sh file & chrome 
exec ~/Pictures/wallpaper.sh &
exec google-chrome-stable &

exec xmonad 			# start WM

