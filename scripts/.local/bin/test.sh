#!/usr/bin/zsh


ANSWER=$(printf '%s\n' a b c | wofi --show=dmenu)

echo $ANSWER

exit 0
