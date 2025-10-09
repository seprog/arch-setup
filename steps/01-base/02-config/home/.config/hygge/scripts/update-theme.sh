#!/usr/bin/env bash


monitor=$1
wallpaper=$2

wallrust_output_dir=$XDG_STATE_HOME/hygge/$monitor
tera_home=$XDG_CONFIG_HOME/hygge/tera/home

shopt -s globstar dotglob

# generate palette of wallpaper and write configs
wallrust --html --colors 3 --output-dir $wallrust_output_dir $wallpaper

for tera_file in $tera_home/**/*.tera
do
  tera_file_stripped=${tera_file%.tera}
  tera --template $tera_file --out ${tera_file_stripped/$tera_home/$HOME} $wallrust_output_dir/wallrust.json
done

# reload applications
# hyprland reloads automatically
# hyprlock reloads automatically
systemctl --user reload-or-restart waybar.service
killall -SIGUSR1 kitty
