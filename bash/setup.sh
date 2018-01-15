#!/bin/bash

echo "Downloading git-prompt for bash"
curl -L -o $HOME/.git-prompt.sh https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

echo "Copying .bashrc and .bash_profile to home folder"
cp ./.bash_profile $HOME/
cp ./.bashrc $HOME/
