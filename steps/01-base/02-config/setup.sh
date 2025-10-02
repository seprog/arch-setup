#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now sddm.service
systemctl --user enable --now foot-server.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now waybar.service
