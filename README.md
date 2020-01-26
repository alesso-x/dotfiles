# dotfiles

## Getting Started

```bash
# Install command line developer tools
xcode-select --install

# Clone dotfiles to $HOME dir
git clone git@github.com:alessod/dotfiles.git $HOME/dotfiles
```

## brew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

set -x HOMEBREW_BUNDLE_MAS_SKIP Keynote 462058435 462062816 462054704 Numbers Pages Xcode
brew bundle --file=$HOME/dotfiles/macOS/Brewfile
```

## macOS

```bash
bash $HOME/dotfiles/macOS/defaults.sh
bash $HOME/dotfiles/macOS/dock.sh
```

## fish shell

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

# omf
curl -L https://get.oh-my.fish | fish

# configuration
mkdir $HOME/.config/fish/functions
rm $HOME/.config/omf/bundle

stow fish
omf install

bash $HOME/dotfiles/macOS/config_dirs.sh
```

## xcode

```bash
# Set Xcode developer tools as the active developer directory
xcode-select -s /Applications/Xcode.app/Contents/Developer/

ln -sf $HOME/dotfiles/xcode/Default.idekeybindings $HOME/Library/Developer/Xcode/UserData/KeyBindings/Default.idekeybindings
# Preferences > Text Editing > Editing > Including whitespace-ony lines
```

## vscode

```bash
cat $HOME/dotfiles/vscode/extensions | xargs -L 1 echo code --install-extension | sh
set -x VSCODE_HOME $HOME/Library/Application\ Support/Code/User

ln -sf $HOME/dotfiles/vscode/settings.json $VSCODE_HOME/settings.json
ln -sf $HOME/dotfiles/vscode/keybindings.json $VSCODE_HOME/keybindings.json
ln -sf $HOME/dotfiles/vscode/snippets/javascript.json $VSCODE_HOME/snippets/javascript.json
ln -sf $HOME/dotfiles/vscode/snippets/typescriptreact.json $VSCODE_HOME/snippets/typescriptreact.json
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
npm i -g yarn
gem install cocoapods
```

## poetry

```bash
pipx install poetry

mkdir ~/.config/fish/completions
poetry completions fish > ~/.config/fish/completions/poetry.fish
```

## stow

```bash
stow bash
stow git
stow karabiner
stow vim
```

## iTerm2

`General > Preferences > Browse`

## zsh

```bash
stow zsh

export ZSH=$XDG_DATA_HOME/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
