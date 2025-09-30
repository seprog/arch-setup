#!/usr/bin/env bash


paru -S --needed --noconfirm $(grep "^[^#]" packages)
