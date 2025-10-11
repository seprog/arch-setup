#!/usr/bin/env bash


# Config
wh_categories="111"
wh_purity="100"
wh_at_least="1920x1080"
wh_ratios="16x9"
wh_top_range="1y"
wh_sorting="toplist"
wh_order="asc"
wh_colors=""
wh_pages_start=1
wh_pages_end=8
wh_api_key=""

output_dir="$HOME/Pictures/Wallpapers"


# Create target folder
mkdir --parents "$output_dir"

# Construct base url (not including pagination)
wh_base_url="https://wallhaven.cc/api/v1/search?"
[[ -n "$wh_categories" ]] && wh_base_url+="categories=$wh_categories&"
[[ -n "$wh_purity" ]] && wh_base_url+="purity=$wh_purity&"
[[ -n "$wh_at_least" ]] && wh_base_url+="atleast=$wh_at_least&"
[[ -n "$wh_ratios" ]] && wh_base_url+="ratios=$wh_ratios&"
[[ -n "$wh_top_range" ]] && wh_base_url+="topRange=$wh_top_range&"
[[ -n "$wh_sorting" ]] && wh_base_url+="sorting=$wh_sorting&"
[[ -n "$wh_order" ]] && wh_base_url+="order=$wh_order&"
[[ -n "$wh_colors" ]] && wh_base_url+="order=$wh_colors&"
echo "$wh_base_url"

# Pagination
wh_page=$wh_pages_start
while [ "$wh_page" -le "$wh_pages_end" ]
do
  wh_url="${wh_base_url}page=$wh_page"
  echo "$wh_url"

  # MAIN COMMAND
  curl --silent --fail --location --header "X-API-Key: $wh_api_key" "$wh_url" | \
  grep --only-matching --perl-regexp '"path":"\K[^"]+' | \
  xargs -P 0 \
    wget --quiet --show-progress --no-clobber --directory-prefix $output_dir

  wh_page=$(($wh_page + 1))
done
