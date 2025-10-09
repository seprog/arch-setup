#!/usr/bin/env bash


SETUP_PATH=$PWD

paru -S --color=auto --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)
