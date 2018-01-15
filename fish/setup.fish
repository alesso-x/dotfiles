#!/usr/bin/env fish

echo "Installing fisherman"
curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

echo "Copying config files"
cp ./config.fish $HOME/.config/fish/
cp ./fishfile $HOME/.config/fish/

echo "Installing plugins"
fisher
