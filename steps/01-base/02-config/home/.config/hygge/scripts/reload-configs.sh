#!/usr/bin/env bash


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
