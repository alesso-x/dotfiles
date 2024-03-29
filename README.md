# dotfiles

## Getting Started

Install command line developer tools

```bash
xcode-select --install
```

Generate a new SSH Key

1. [Generating a new SSH key - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2. `brew install gh`
3. `gh auth login`

Clone Dotfiles repo

```bash
export DOTFILES_HOME=$HOME/dotfiles
git clone git@github.com:alesso-x/dotfiles.git $DOTFILES_HOME
```

Configure Dirs

```bash
mkdir $DOTFILES_HOME/_private
touch $DOTFILES_HOME/_private/vars.sh
touch $DOTFILES_HOME/_private/work_config.fish
```

Make programs executable

```bash
chmod +x $DOTFILES_HOME/.bin/*
```

## brew

Install [Brew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Apps

```bash
export HOMEBREW_BUNDLE_MAS_SKIP="Pages Numbers Keynote iMovie GarageBand Xcode 462058435 462062816 462054704"
brew bundle --file=$DOTFILES_HOME/macOS/Brewfile
```

## fish shell

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

# fisher
# open fish shell before next step
fish_add_path /opt/homebrew/bin
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# configuration
rm ~/.config/fish/config.fish
stow --adopt fish
fisher update

# docker completion
/bin/ln -shi /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion ~/.config/fish/completions/docker.fish
/bin/ln -shi /Applications/Docker.app/Contents/Resources/etc/docker-compose.fish-completion ~/.config/fish/completions/docker-compose.fish
```

## stow

```bash
stow asdf
stow bash
stow karabiner
stow starship
stow git
git lfs install
```

## vscode

```bash
# Command Pallet... > Shell Command: Install 'code' command in PATH
# cat $DOTFILES_HOME/vscode/extensions | xargs -L 1 echo code --install-extension | sh

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

## iTerm2

```bash
# Profiles > Other Actions... > Import JSON Profiles...
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_HOME/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

## zsh

```bash
# open zsh before running these commands
export ZSH=$XDG_DATA_HOME/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
stow zsh

git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
