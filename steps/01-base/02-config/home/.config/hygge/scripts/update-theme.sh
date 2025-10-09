#!/usr/bin/env bash


monitor=$1
wallpaper=$2


wallrust_output_dir=$XDG_STATE_HOME/hygge/$monitor
tera_home=$XDG_CONFIG_HOME/hygge/tera/home


shopt -s globstar dotglob

# --- generate palette from wallpaper ---
wallrust --html --colors 3 --output-dir $wallrust_output_dir $wallpaper

# --- write configs ---
for tera_file in $tera_home/**/*.tera
do
  tera_file_stripped=${tera_file%.tera}
  mkdir --parents $(dirname ${tera_file_stripped/$tera_home/$HOME})
  tera \
    --template $tera_file \
    --out ${tera_file_stripped/$tera_home/$HOME} \
    $wallrust_output_dir/wallrust.json
done

# --- reload applications ---
# hyprland
# reloads automatically

# hyprlock
# reloads automatically

# waybar
systemctl --user reload waybar.service

# kitty
killall -SIGUSR1 kitty

# mako
# only needs killing, starts automatically on notification
killall mako
