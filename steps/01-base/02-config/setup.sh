#!/usr/bin/env bash


SETUP_PATH=$PWD

cp --recursive $SETUP_PATH/home/. ~

systemctl --user enable --now hyprpolkitagent.service
