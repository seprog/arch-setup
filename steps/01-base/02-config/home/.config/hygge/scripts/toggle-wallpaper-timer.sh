#!/usr/bin/env bash


if [[ $(systemctl --user is-enabled set-wallpaper.timer) == "enabled" ]]
then
  systemctl --user disable --now set-wallpaper.timer
  notify-send -u low "Wallpaper Timer Disabled"
else
  systemctl --user enable --now set-wallpaper.timer
  notify-send -u low "Wallpaper Timer Enabled"
fi
