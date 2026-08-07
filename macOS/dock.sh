#!/bin/bash

# Rebuilds the Dock from scratch. Run after `brew bundle`, since most of these
# apps come from the Brewfile.

dockutil --no-restart --remove all

dockutil --no-restart --add /Applications/Safari.app
dockutil --no-restart --add /System/Applications/Mail.app
dockutil --no-restart --add /System/Applications/Calendar.app
dockutil --no-restart --add /System/Applications/Messages.app
dockutil --no-restart --add /System/Applications/Music.app
dockutil --no-restart --add /Applications/Spotify.app
dockutil --no-restart --add "/Applications/Poolsuite FM.app"
dockutil --no-restart --add /Applications/DaftCloud.app
dockutil --no-restart --add /Applications/Bear.app
dockutil --no-restart --add /Applications/iTerm.app
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add /Applications/DataGrip.app
dockutil --no-restart --add /Applications/Insomnia.app

dockutil --no-restart --add "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Screenshots" --view grid --display stack --sort dateadded
dockutil --no-restart --add "$HOME/Downloads" --view grid --display stack --sort dateadded

killall Dock
