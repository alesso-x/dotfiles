# dotfiles

## Getting Started

```bash
# Install command line developer tools
xcode-select --install

# set dotfiles location
export DOTFILES_HOME=$HOME/dotfiles

# Clone dotfiles to $HOME dir
git clone git@github.com:alessod/dotfiles.git $DOTFILES_HOME
chmod +x $DOTFILES_HOME/.bin/*
```

## brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

export HOMEBREW_BUNDLE_MAS_SKIP="Pages Numbers Keynote iMovie GarageBand Xcode 462058435 462062816 462054704"

brew bundle --file=$DOTFILES_HOME/macOS/Brewfile
```

## fish shell

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

# fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher update

# configuration
# mkdir $HOME/.config/fish/functions
rm ~/.config/fish/fishfile
stow fish

bash $DOTFILES_HOME/macOS/config_dirs.sh

# docker completion
/bin/ln -shi /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion ~/.config/fish/completions/docker.fish
/bin/ln -shi /Applications/Docker.app/Contents/Resources/etc/docker-compose.fish-completion ~/.config/fish/completions/docker-compose.fish
```

## vscode

```bash
# Command Pallet... > Shell Command: Install 'code' command in PATH
cat $DOTFILES_HOME/vscode/extensions | xargs -L 1 echo code --install-extension | sh

# for vscode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Manually link files until https://github.com/microsoft/vscode/issues/3884
export VSCODE_HOME="$HOME/Library/Application Support/Code/User"
ln -sf $DOTFILES_HOME/vscode/settings.json $VSCODE_HOME/settings.json
ln -sf $DOTFILES_HOME/vscode/keybindings.json $VSCODE_HOME/keybindings.json
ln -sf $DOTFILES_HOME/vscode/snippets/* $VSCODE_HOME/snippets/
```

## macOS

```bash
bash $DOTFILES_HOME/macOS/defaults.sh
bash $DOTFILES_HOME/macOS/dock.sh
```

## xcode

```bash
# Set Xcode developer tools as the active developer directory
# Check with `xcode-select --print-path`
xcode-select -s /Applications/Xcode.app/Contents/Developer/

ln -sf $DOTFILES_HOME/xcode/com.apple.dt.Xcode.plist $HOME/Library/Preferences/com.apple.dt.Xcode.plist
ln -sf $DOTFILES_HOME/xcode/Default.idekeybindings $HOME/Library/Developer/Xcode/UserData/KeyBindings/Default.idekeybindings
# Preferences > Text Editing > Editing > Including whitespace-ony lines
```

## asdf

```bash
# python
asdf plugin-add python
asdf install python latest
asdf global python (asdf latest python)

# nodejs
asdf plugin-add nodejs
asdf install nodejs latest
asdf install nodejs lts
asdf global nodejs (asdf latest nodejs)

# java
asdf plugin-add java
asdf install java (asdf latest java openjdk)
asdf global java (asdf latest java openjdk)

# cli
# rm -rf ~/.local/pipx/ after upgrading python
pipx install soundscrape
pipx install ytmdl
```

## vim

```bash
stow vim
curl -sLf https://spacevim.org/install.sh | bash
```

## stow

```bash
stow bash
stow karabiner
stow starship
stow git
git lfs install
```

## iTerm2

```bash
# Profiles > Other Actions... > Import JSON Profiles...
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_HOME/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

## DataGrip

`Tools > Create Command-line Launcher...`

## zsh

```bash
export ZSH=$XDG_DATA_HOME/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
stow zsh

git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

## helm

```bash
# Add Helm stable charts repository
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
```
