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
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

set -x HOMEBREW_BUNDLE_MAS_SKIP Keynote 462058435 462062816 462054704 Numbers Pages Xcode
brew bundle --file=$DOTFILES_HOME/macOS/Brewfile
```

## macOS

```bash
bash $DOTFILES_HOME/macOS/defaults.sh
bash $DOTFILES_HOME/macOS/dock.sh
```

## fish shell

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

# fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher

# configuration
mkdir $HOME/.config/fish/functions
stow fish

bash $DOTFILES_HOME/macOS/config_dirs.sh
```

## xcode

```bash
# Set Xcode developer tools as the active developer directory
xcode-select -s /Applications/Xcode.app/Contents/Developer/

ln -sf $DOTFILES_HOME/xcode/com.apple.dt.Xcode.plist $HOME/Library/Preferences/com.apple.dt.Xcode.plist
ln -sf $DOTFILES_HOME/xcode/Default.idekeybindings $HOME/Library/Developer/Xcode/UserData/KeyBindings/Default.idekeybindings
# Preferences > Text Editing > Editing > Including whitespace-ony lines
```

## vscode

```bash
# Command Pallet... > Shell Command: Install 'code' command in PATH
cat $DOTFILES_HOME/vscode/extensions | xargs -L 1 echo code --install-extension | sh

# for vscode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Manually link files until https://github.com/microsoft/vscode/issues/3884
set -x VSCODE_HOME $HOME/Library/Application\ Support/Code/User
ln -sf $DOTFILES_HOME/vscode/settings.json $VSCODE_HOME/settings.json
ln -sf $DOTFILES_HOME/vscode/keybindings.json $VSCODE_HOME/keybindings.json
ln -sf $DOTFILES_HOME/vscode/snippets/javascript.json $VSCODE_HOME/snippets/javascript.json
ln -sf $DOTFILES_HOME/vscode/snippets/typescriptreact.json $VSCODE_HOME/snippets/typescriptreact.json
```

## asdf

```bash
# python
asdf plugin-add python
asdf install python (asdf latest python)
asdf global python (asdf latest python)

# nodejs
asdf plugin-add nodejs
bash $ASDF_DATA_DIR/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs (asdf latest nodejs)
asdf global nodejs (asdf latest nodejs)

# java
asdf plugin-add java
asdf install java [versoin]  # i.e. adopt-openjdk-13.0.2+8
asdf global java [version]

# ruby
asdf plugin-add ruby
asdf install ruby (asdf latest ruby)
asdf global ruby (asdf latest ruby)

# lang dependencies
python -m pip install --user pipx
pipx install soundscrape
gem install cocoapods
```

## poetry

```bash
pipx install poetry

mkdir ~/.config/fish/completions
poetry completions fish > ~/.config/fish/completions/poetry.fish
```

## vim

```bash
stow vim
curl -sLf https://spacevim.org/install.sh | bash
```

## stow

```bash
stow bash
stow git
stow karabiner
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
