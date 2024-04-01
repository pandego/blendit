#!/bin/bash

echo "Eh, what's up, Doc? Just checking if git-lfs is around... 🥕"

if [ -x "$(command -v git-lfs)" ]; then
  echo "Voilà! git-lfs is on board! 🚀"
else
  echo "Ruh-roh, looks like git-lfs is MIA. Could you kindly install it from https://git-lfs.github.com? 🛑"
  exit 1
fi

echo "Alrighty, where are we stashing the loot (a.k.a. models)? 🎩"
read -p "Point me to the magic directory, Doc: " models_dir

if [ -z "$models_dir" ]; then
  echo "As quiet as Marvin the Martian plotting Earth's demise... You didn't enter anything. Exiting... 🌎💥"
  exit 1
fi

if [ -d "$models_dir" ]; then
  echo "This den's already got some occupants. 🏠"
  read -p "Is it cool if we sneak in our models without disturbing the current setup? (y/n): " confirm

  case $confirm in
    [Yy]* )
      echo "Great! We'll be as stealthy as Bugs Bunny in disguise. 🕵️‍♂️";;
    [Nn]* )
      echo "No worries! We respect your space. Exiting like Daffy Duck in a huff... 🦆"
      exit 1;;
    * )
      echo "Eh, can you repeat that, Doc? Didn't catch it. Exiting just to be safe... 🐰"
      exit 1;;
  esac
else
  echo "No den here. Let's dig one! 🕳️"
  mkdir -p "$models_dir"
fi

cd "$models_dir" || { echo "Blast! Couldn't jump into the directory. Something's up. Exiting... 🚀"; exit 1; }

echo "Patience, Doc. Downloading the models, might take a tad longer than Elmer Fudd's realization he's been duped...again. 🕰️"

# Proceed to download the models
if ! huggingface-cli download SanjiWatsuki/Kunoichi-DPO-v2-7B --repo-type model --local-dir SanjiWatsuki/Kunoichi-DPO-v2-7B --local-dir-use-symlinks False \
|| ! huggingface-cli download paulml/NeuralOmniWestBeaglake-7B --repo-type model --local-dir paulml/NeuralOmniWestBeaglake-7B --local-dir-use-symlinks False \
|| ! huggingface-cli download mistralai/Mistral-7B-Instruct-v0.2 --repo-type model --local-dir mistralai/Mistral-7B-Instruct-v0.2 --local-dir-use-symlinks False; then
  echo "Fiddlesticks! The downloads went as awry as Wile E. Coyote's plans. Better check on that. 🏜️"
  exit 1
else
  echo "Success! Models downloaded as smoothly as Bugs Bunny slipping away from Yosemite Sam. 🎉"
fi