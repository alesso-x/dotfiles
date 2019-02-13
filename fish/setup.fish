#!/usr/bin/env fish

echo "Installing fisher"
curl https://git.io/fisher --create-dirs -sLo $HOME/.config/fish/functions/fisher.fish

echo "Installing plugins"
fisher
