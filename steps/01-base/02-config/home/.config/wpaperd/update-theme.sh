#!/usr/bin/env sh


monitor=$1
wallpaper=$2

wallrust --wallset --html --colors 3 --output-dir $XDG_STATE_HOME/dynamic-theme/active $2

systemctl --user reload-or-restart waybar.service