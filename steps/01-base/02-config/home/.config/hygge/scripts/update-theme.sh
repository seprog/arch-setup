#!/usr/bin/env sh


monitor=$1
wallpaper=$2

wallrust_output_dir=$XDG_STATE_HOME/hygge/$monitor
tera_home=$XDG_CONFIG_HOME/hygge/tera/home

shopt -s globstar dotglob

# generate palette of wallpaper and write configs
wallrust --html --colors 3 --output-dir $wallrust_output_dir $wallpaper

ls -aR $tera_home/**/*.tera | \
xargs -I {} \
  tera --template {} --out $(echo {} | sed "s|$tera_home|$HOME|" | sed "s|.tera||") $wallrust_output_dir/wallrust.json

# reload applications
# hyprland reloads automatically
# hyprlock reloads automatically
systemctl --user reload-or-restart waybar.service
killall -SIGUSR1 kitty
