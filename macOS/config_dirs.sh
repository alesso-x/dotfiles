#!/bin/bash

# Creates the directories the shell configs and tools expect to exist.
# Safe to re-run.

set -u

echo "Dotfiles home: $DOTFILES_HOME"

# XDG
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"

# dotfiles
mkdir -p "$DOTFILES_HOME/_backup"

# ASDF
# $AWS_CONFIG_FILE and $ASDF_DEFAULT_TOOL_VERSIONS_FILENAME used to be handled
# here too, but neither is set anywhere, so those lines only ever errored.
mkdir -p "$(dirname "$ASDF_CONFIG_FILE")"; touch "$ASDF_CONFIG_FILE"
mkdir -p "$ASDF_DATA_DIR"

# Bash
mkdir -p "$XDG_DATA_HOME/bash"; touch "$XDG_DATA_HOME/bash/history"

# Zsh
mkdir -p "$XDG_DATA_HOME/zsh"; touch "$XDG_DATA_HOME/zsh/history"

# workspace
mkdir -p "$HOME/workspace"
