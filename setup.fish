#!/usr/bin/env fish

echo "Install omf"
curl -L https://get.oh-my.fish | fish

echo "Installing omf plugins"
omf install
