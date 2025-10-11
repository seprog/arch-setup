#!/usr/bin/env bash


theme_json=$1
tera_home=$2


[[ -n "$tera_home" ]] || tera_home=$HOME/.config/hygge/tera/home


shopt -s globstar dotglob
for tera_file in $tera_home/**/*.tera
do
  tera_file_stripped=${tera_file%.tera}
  mkdir --parents $(dirname ${tera_file_stripped/$tera_home/$HOME})
  tera \
    --template $tera_file \
    --out ${tera_file_stripped/$tera_home/$HOME} \
    $theme_json
done
