#!/usr/bin/env fish

echo "Installing fisher"
curl https://git.io/fisher --create-dirs -sLo $HOME/.config/fish/functions/fisher.fish

echo "Installing plugins"
fisher

echo "Install omf"
curl -L https://get.oh-my.fish | fish

echo "INstalling omf plugins"
omf install
