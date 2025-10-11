#!/usr/bin/env bash


wallpaper=$1
theme_dir=$2


wallrust --no-templates --colors 3 --output-dir $theme_dir $wallpaper
