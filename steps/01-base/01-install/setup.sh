#!/usr/bin/env bash


if ! type "paru" > /dev/null; then
  cd /tmp
  sudo pacman --sync --needed --noconfirm base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg --syncdeps --install --needed --noconfirm
  cd ..
  sudo rm --recursive paru
fi

paru -S --needed --noconfirm $(grep "^[^#]" packages)
