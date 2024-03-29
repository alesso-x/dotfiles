#!/bin/bash

echo "Dotfiles home: $DOTFILES_HOME"

# XDG
# mkdir $HOME/.config           # XDG_CONFIG_HOME
# mkdir $HOME/.cache            # XDG_CACHE_HOME
mkdir -p $HOME/.local/share   # XDG_DATA_HOME

# dotfiles
mkdir $DOTFILES_HOME/_backup

# AWS
mkdir -p $(dirname "$AWS_CONFIG_FILE")

# ASDF
mkdir -p $(dirname "$ASDF_CONFIG_FILE"); touch $ASDF_CONFIG_FILE
mkdir -p $ASDF_DATA_DIR
touch $ASDF_DEFAULT_TOOL_VERSIONS_FILENAME

# Bash
mkdir -p $XDG_DATA_HOME/bash; touch $XDG_DATA_HOME/bash/history

# Zsh
mkdir -p $XDG_DATA_HOME/zsh; touch $XDG_DATA_HOME/zsh/history

# workspace
mkdir $HOME/workspace
