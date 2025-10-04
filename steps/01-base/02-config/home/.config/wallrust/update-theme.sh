#!/usr/bin/env sh


monitor=$1
wallpaper=$2

# generate palette of wallpaper and write configs
wallrust --wallset --html --colors 3 --output-dir $XDG_STATE_HOME/wallrust/$monitor $wallpaper

# reload applications
# hyprland reloads automatically
# hyprlock reloads automatically
systemctl --user reload-or-restart waybar.service
killall -SIGUSR1 kitty
