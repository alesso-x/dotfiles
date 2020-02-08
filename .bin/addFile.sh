#!/bin/bash

#######################################
# Add file to dotfiles
#
# Globals:
#   None
# Arguments:
#   folder - folder for file path in dotfiles
#   path - file path to add
# Returns:
#   None
#######################################

# Usage
#
# Add file
# ./.bin/addFile.sh vim ~/.vimrc
#
# Remove file
# stow --delete vim

folder=$1
path=$2

if [[ ! "$path" == *"$HOME"* ]]; then
  echo "File path must be absolute from home directory"
  exit 1
fi

dotfile_path=$HOME/dotfiles/$folder/${path#$HOME/}
echo "Adding $path to dotfiles in $folder"
mkdir -p $(dirname "$dotfile_path"); touch $dotfile_path
stow --adopt $folder
