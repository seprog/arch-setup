#!/usr/bin/env sh


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable NetworkManager.service
sudo systemctl enable sddm.service
systemctl --user enable hypridle.service
systemctl --user enable hyprpolkitagent.service
systemctl --user enable waybar.service

bash ~/.config/hygge/wallhaven.sh

xdg-user-dirs-update
sudo chsh -s $(which fish) $USER
