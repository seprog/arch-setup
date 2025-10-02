#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable NetworkManager.service
sudo systemctl enable sddm.service
systemctl --user enable foot-server.service
systemctl --user enable hyprpolkitagent.service
systemctl --user enable waybar.service

xdg-user-dirs-update
chsh -s $(which fish)
rm ~/.bash*
