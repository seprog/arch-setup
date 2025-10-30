#!/usr/bin/env bash


[[ -n "${wallpaper_dir}" ]] || wallpaper_dir="${HOME}/Pictures/Wallpapers"
[[ -n "${thumbs_dir}" ]]    || thumbs_dir="${HOME}/.cache/hygge/thumbs"

THUMBNAIL_WIDTH=512
THUMBNAIL_HEIGHT=512


mkdir --parents "${thumbs_dir}"

for wallpaper in $(find -L ${wallpaper_dir} -type f)
do
  thumbnail="${wallpaper/${wallpaper_dir}/${thumbs_dir}}"
  thumbnail_dir=$(dirname "${wallpaper/${wallpaper_dir}/${thumbs_dir}}")

  [[ -d "${thumbnail_dir}" ]] || mkdir --parents "${thumbnail_dir}"
  [[ -f "${thumbnail}" ]]     || magick "${wallpaper}" -thumbnail "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" "${thumbnail}"
done

find -L "${wallpaper_dir}" -type f | \
sed "s|${wallpaper_dir}|img:${thumbs_dir}|g" | \
wofi \
  --dmenu \
  --allow-images \
  --define "image_size=${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" \
  --columns 3 \
  --prompt "Select Wallpaper" | \
sed "s|img:${thumbs_dir}|${wallpaper_dir}|g"
