#!/usr/bin/env bash


monitor=$1
wallpaper=$2


active_monitor="HDMI-A-1"


wallrust_output_dir=$HOME/.local/state/hygge/$monitor
tera_home=$HOME/.config/hygge/tera/home


shopt -s globstar dotglob

if [ $monitor = $active_monitor ] || [ $monitor = "default" ]
then
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
  [ $monitor = "default" ] && exit

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
fi

# --- notify about change ---
notify-send -u low "Current Wallpaper" "$monitor: $wallpaper"
