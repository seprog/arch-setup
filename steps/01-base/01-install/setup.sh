#!/usr/bin/env bash


SETUP_PATH=$PWD

# TODO suppress type error
if ! type "paru" > /dev/null; then
  sudo pacman --sync --needed --noconfirm base-devel
  [[ -d /tmp/paru ]] && sudo rm --recursive /tmp/paru
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  cd /tmp/paru
  makepkg --syncdeps --install --needed --noconfirm
  cd $SETUP_PATH
  sudo rm --recursive /tmp/paru
fi

paru -S --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)
