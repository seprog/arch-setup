#!/usr/bin/env sh


SETUP_PATH=$PWD

paru -S --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)
