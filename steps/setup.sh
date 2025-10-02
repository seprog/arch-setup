#!/usr/bin/env sh


shopt -s globstar
SETUP_PATH=$PWD
for setup_file in */**/*/setup.sh; do
  read -r -p $'Execute step \e[1m'$(dirname $setup_file)$'\e[0m? (y/N) ' execute
  [[ $execute == [Yy]* ]] && cd $SETUP_PATH/$(dirname $setup_file) && bash setup.sh
done
cd $SETUP_PATH

# cd .. && rm -R arch-setup
