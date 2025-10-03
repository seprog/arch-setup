#!/usr/bin/env sh


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable NetworkManager.service
sudo systemctl enable sddm.service
systemctl --user enable hypridle.service
systemctl --user enable hyprpolkitagent.service
systemctl --user enable waybar.service

mkdir --parents ~/Pictures/Wallpaper
ln --symbolic \
  /usr/share/Backgrounds/* \
  /usr/share/backgrounds/* \
  /usr/share/Background/* \
  /usr/share/background/* \
  /usr/share/Wallpapers/* \
  /usr/share/wallpapers/* \
  /usr/share/Wallpaper/* \
  /usr/share/wallpaper/* \
  ~/Pictures/Wallpaper

xdg-user-dirs-update
sudo chsh -s $(which fish) $USER
