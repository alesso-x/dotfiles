# dotfiles

## Clone dotfiles to `$HOME` dir

`git clone git@github.com:alessod/dotfiles.git $HOME/dotfiles`

## xcode

```bash
xcode-select --install

ln -sf $HOME/dotfiles/xcode/Default.idekeybindings $HOME/Library/Developer/Xcode/UserData/KeyBindings/Default.idekeybindings

# Point xcode-select to the Xcode app Developer directory
# xcode-select -s /Applications/Xcode.app/Contents/Developer/

# Preferences > Text Editing > Editing > Including whitespace-ony lines
```

## [brew](https://brew.sh)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=$HOME/dotfiles/macOS/Brewfile
```

## macOS

```bash
bash $HOME/dotfiles/macOS/defaults.sh
bash $HOME/dotfiles/macOS/dock.sh
```

## [fish shell](https://fishshell.com)

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
curl -L https://get.oh-my.fish | fish
```

```fish
mkdir $HOME/dotfiles/.config/fish/functions
stow fish
omf install
```

```
bash $HOME/dotfiles/macOS/config_dirs.sh
```

## [vscode](https://code.visualstudio.com)

```bash
cat $HOME/dotfiles/vscode/extensions | xargs -L 1 echo code --install-extension | sh

ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -sf $HOME/dotfiles/vscode/snippets/javascript.json $HOME/Library/Application\ Support/Code/User/snippets/javascript.json
```

## asdf

```bash
# python
asdf plugin-add python
asdf install python [version] # i.e. 3.7.3
asdf global python [version]

# nodejs
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs [version] # i.e. 10.16.0
asdf global nodejs [version]

# ruby
asdf plugin-add ruby
asdf install ruby [version] # i.e. 2.6.3
asdf global ruby [version]
```

## pipx

```bash
python -m pip install --user pipx
```

## [stow](https://www.gnu.org/software/stow/)

`stow bash git karabiner tmux vim`
