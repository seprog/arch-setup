#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

bash ~/.config/hygge/scripts/wallhaven.sh
mkdir --parents "$HOME/Pictures/Wallpapers"
ln -s "$HOME/Pictures/Wallhaven" "$HOME/Pictures/Wallpapers/"
