#!/usr/bin/env bash


wallpaper=$1
theme_dir=$2


[[ -n "$theme_dir" ]] || theme_dir=/dev/null


wallrust --no-templates --colors 3 --output-dir $theme_dir $wallpaper
