#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable NetworkManager.service
sudo systemctl enable sddm.service
systemctl --user enable hyprpaper.service
systemctl --user enable hypridle.service
systemctl --user enable hyprpolkitagent.service
systemctl --user enable waybar.service
systemctl --user enable set-wallpaper.service
systemctl --user enable set-wallpaper.timer

bash ~/.config/hygge/scripts/generate-theme.sh "$SETUP_PATH/wallrust-gradient.svg" "/tmp/.local/state/hygge/theme/initial"
bash ~/.config/hygge/scripts/generate-configs.sh /tmp/.local/state/hygge/theme/initial/wallrust.json

xdg-user-dirs-update
sudo chsh -s $(which fish) $USER
