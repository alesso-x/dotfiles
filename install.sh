#!/bin/bash

function heading() {
  echo -e "\033[95m==========> $1\033[0m"
}

echo -e "\033[01;34m================================================"
echo "Lets setup your mac!"
echo -e "================================================\033[0m\n"
read -p "Press any key to continue... " -n1 -s
echo -e '\n'

heading "Checking command line tools"
if ! [ $(xcode-select -p) ]; then
  heading "Installing command line tools"
  xcode-select --install
fi

# Xcode Command Line tools no longer installs needed headers in /usr/include.
# https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

#
# Homebrew setup
#

heading "Checking homebrew"
if ! [ -x "$(command -v brew)" ]; then
  heading "Installing homebrew"
  ruby -e "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

heading "Installing dependencies and apps"
brew update
brew install mas
brew bundle --file=./macOS/Brewfile
brew cleanup

#
# Fish setup
#

heading "Setting up fish"
bash ./setup.fish

heading "Checking if fish is in /etc/shells"
if ! grep -Fxq "$(command -v fish)" /etc/shells; then
  heading "Adding fish to /etc/shells"
  echo "$(command -v fish)" | sudo tee -a /etc/shells
fi

heading "Changing default shell to fish"
chsh -s "$(command -v fish)"


#
# macOS defaults
#

heading "Configuring macOS defaults"
bash ./macOS/defaults.sh
bash ./macOS/dock.sh

# stow bash fish git karabiner tmux vim
# ln -s  $HOME/dotfiles/vscode/settings.json  $HOME/Library/Application\ Support/Code/User/settings.json
# ln -s  $HOME/vscode/keybindings.json  $HOME/Library/Application\ Support/Code/User/keybindings.json

heading "Done!"
