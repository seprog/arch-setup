#!/usr/bin/env bash


wallpaper=$1
wallrust_output_dir=$2


[[ -n "$wallrust_output_dir" ]] || wallrust_output_dir=/dev/null


wallrust --no-templates --colors 3 --output-dir $wallrust_output_dir $wallpaper
