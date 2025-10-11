#!/usr/bin/env bash


monitor=$1
wallpaper=$2


active_monitor="HDMI-A-1"


theme_dir=$HOME/.local/state/hygge/theme/$monitor


bash $HOME/.config/hygge/scripts/generate-theme.sh $wallpaper $theme_dir

[ $monitor != $active_monitor ] && exit

bash $HOME/.config/hygge/scripts/generate-configs.sh $theme_dir/wallrust.json
bash $HOME/.config/hygge/scripts/reload-configs.sh

notify-send -u low "Current Wallpaper" "$(wpaperctl get-all)"
