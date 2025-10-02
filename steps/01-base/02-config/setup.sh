#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now waybar.service
systemctl --user enable --now foot-server.service
