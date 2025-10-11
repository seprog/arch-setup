#!/usr/bin/env bash


monitor=$1
wallpaper=$2


active_monitor="HDMI-A-1"


theme_dir=$HOME/.local/state/hygge/theme


bash $HOME/.config/hygge/scripts/generate-theme.sh $wallpaper $theme_dir/monitors/$monitor
jq -n \
  --argjson active_content "$(cat $theme_dir/monitors/$active_monitor/wallrust.json)" \
  '{ "monitors": ( reduce inputs as $file ( {}; . + { ( ($file | input_filename | split("/") | .[-2]) ): $file } ) ) } + $active_content' \
  $theme_dir/monitors/*/wallrust.json > $theme_dir/theme.json

[ $monitor != $active_monitor ] && exit

bash $HOME/.config/hygge/scripts/generate-configs.sh $theme_dir/theme.json
bash $HOME/.config/hygge/scripts/reload-configs.sh

notify-send -u low "Current Wallpaper" "$(wpaperctl get-all)"
