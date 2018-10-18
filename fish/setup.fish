#!/usr/bin/env fish

echo "Installing fisherman"
curl https://git.io/fisher --create-dirs -sLo $HOME/.config/fish/functions/fisher.fish

echo "Copying config files"
cp ./config.fish $HOME/.config/fish/
cp ./fishfile $HOME/.config/fish/

echo "Installing plugins"
fisher
