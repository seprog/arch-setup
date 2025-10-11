#!/usr/bin/env bash


monitor=$1
wallpaper=$2


active_monitor="HDMI-A-1"


wallrust_output_dir=$HOME/.local/state/hygge/theme/$monitor


bash $HOME/.config/hygge/scripts/generate-theme.sh $wallpaper $wallrust_output_dir
if [ $monitor != $active_monitor ]
then
  tera \
      --template $HOME/.config/hygge/tera/home/.config/waybar/style.css.tera \
      --out $HOME/.config/waybar/style.css \
      --env=monitor=$monitor \
      $wallrust_output_dir/wallrust.json
  systemctl --user reload waybar.service
  exit
fi
bash $HOME/.config/hygge/scripts/generate-configs.sh $wallrust_output_dir/wallrust.json
bash $HOME/.config/hygge/scripts/reload-configs.sh

notify-send -u low "Current Wallpaper" "$(wpaperctl get-all)"
