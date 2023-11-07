xsetroot -solid black &

setxkbmap -model pc105 -layout us -option compose:lwin,ctrl:nocaps,shift:both_capslock_cancel &

sleep 1 && st -e tmux &

exec dwm
