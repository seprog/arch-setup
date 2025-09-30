#!/usr/bin/env bash


shopt -s globstar
RETURN_PATH=$PWD
cd steps
for setup_file in **/setup.sh; do 
  read -r -p $'Execute step \e[1m'"$(dirname "$setup_file")"$'\e[0m? (y/N) ' execute
  [[ $execute == [Yy]* ]] && cd $(dirname "$setup_file") && bash setup.sh
done
cd $RETURN_PATH

# cd .. && rm -R arch-setup
