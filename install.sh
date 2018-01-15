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

heading "Checking homebrew"
if ! [ -x "$(command -v brew)" ]; then
  heading "Installing homebrew"
  ruby -e "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

heading "Installing Mac App Store cli (mas)"
brew install mas

heading "Installing dependencies and apps"
brew bundle --file=./macOS/Brewfile

brew cleanup

heading "Setting up bash"
chmod +x ./bash/setup.sh
./bash/setup.sh

heading "Checking if fish is in /etc/shells"
if ! grep -Fxq "$(command -v fish)" /etc/shells; then
  heading "Adding fish to /etc/shells"
  echo "$(command -v fish)" | sudo tee -a /etc/shells
fi

heading "Changing default shell to fish"
chsh -s "$(command -v fish)"

heading "Setting up fish config and plugins"
chmod +x ./fish/setup.fish
./fish/setup.fish

heading "Configuring macOS defaults"
chmod +x ./macOS/defaults.sh
chmod +x ./macOS/dock.sh
./macOS/defaults.sh
./macOS/dock.sh

heading "Done!"
