#!/usr/bin/env bash


monitor=$1
wallpaper=$2


active_monitor="HDMI-A-1"


wallrust_output_dir=$HOME/.local/state/hygge/theme/$wallpaper


bash $HOME/.config/hygge/scripts/generate-theme.sh $wallpaper $wallrust_output_dir

[ $monitor != $active_monitor ] && exit

bash $HOME/.config/hygge/scripts/generate-configs.sh $wallrust_output_dir/wallrust.json
bash $HOME/.config/hygge/scripts/reload-configs.sh

notify-send -u low "Current Wallpaper" "$(wpaperctl get-all)"
