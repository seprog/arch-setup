#!/usr/bin/env bash


shopt -s globstar
SETUP_PATH=$PWD
cd steps
for setup_file in $SETUP_PATH/**/setup.sh; do 
  read -r -p $'Execute step \e[1m'"$(dirname "$setup_file")"$'\e[0m? (y/N) ' execute
  [[ $execute == [Yy]* ]] && cd $(dirname "$setup_file") && bash setup.sh
done
cd $SETUP_PATH

# cd .. && rm -R arch-setup
