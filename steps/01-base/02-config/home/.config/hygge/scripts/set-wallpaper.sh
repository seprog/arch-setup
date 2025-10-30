#!/usr/bin/env bash


wallpaper_dir="$HOME/Pictures/Wallpapers"
scripts_dir="$HOME/.config/hygge/scripts"
theme_dir="$HOME/.local/state/hygge/theme"

mkdir --parents "$wallpaper_dir"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
if [[ -n "$1" ]]; then
  if [[ "$1" == "focused" ]]; then
    monitors=($focused_monitor)
  elif [[ "$1" == "choose" ]]; then
    monitors=($(hyprctl monitors -j | jq -r '.[].name' | wofi --dmenu))
  else
    monitors=($1)
  fi
else
  monitors=($(hyprctl monitors -j | jq -r '.[].name'))
fi

# Preload Wallpapers
# Generate Wallpaper Themes
for monitor in "${monitors[@]}"; do
  # TODO prevent finding same wallpaper except its the only one possible
  #      (inspiration https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/#using-reload-to-randomize-your-wallpaper)
  # TODO only find correct file types
  #      (png, jpg, jpeg, jpeg xl, webp)
  #      (accorging to https://github.com/hyprwm/hyprpaper?tab=readme-ov-file#usage)
  if [[ -n "$2" ]]; then
    if [[ "$2" == "choose" ]]; then
      wallpaper=$(find -L "$wallpaper_dir" -type f | wofi --dmenu)
    else
      wallpaper="$2"
    fi
  else
    wallpaper=$(find -L "$wallpaper_dir" -type f | shuf -n 1)
  fi
  [[ -n "$wallpaper" ]] || exit
  hyprctl hyprpaper preload "$wallpaper"
  bash $scripts_dir/generate-theme.sh $wallpaper $theme_dir/monitors/$monitor
done

# Join Wallpaper Themes into Main Theme
jq -n \
  --argjson active_content "$(cat $theme_dir/monitors/$focused_monitor/wallrust.json)" \
  '{ "monitors": ( reduce inputs as $file ( {}; . + { ( ($file | input_filename | split("/") | .[-2]) ): $file } ) ) } + $active_content' \
  $theme_dir/monitors/*/wallrust.json \
  > $theme_dir/theme.json

# Generate Configs
bash $scripts_dir/generate-configs.sh "$theme_dir/theme.json"

# Reload Configs
bash $scripts_dir/reload-configs.sh

# Set new Wallpapers and unload old
jq -r '.monitors | to_entries[] | "\"\(.key)\",\"\(.value.wallpaper)\""' "$theme_dir/theme.json" | \
xargs -L 1 \
  hyprctl hyprpaper wallpaper
hyprctl hyprpaper unload unused
