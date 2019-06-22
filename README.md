# dotfiles

## xcode

```bash
xcode-select --install

ln -sf $HOME/dotfiles/xcode/Default.idekeybindings $HOME/Library/Developer/Xcode/UserData/KeyBindings/Default.idekeybindings

# Preferences > Text Editing > Editing > Including whitespace-ony lines
```

## [brew](https://brew.sh)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=./macOS/Brewfile
```

## macOS

```bash
bash ./macOS/defaults.sh
bash ./macOS/dock.sh
```

## [fish shell](https://fishshell.com)

```bash
stow fish
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
```

```fish
curl -L https://get.oh-my.fish | fish
omf install
```

## [vscode](https://code.visualstudio.com)

```bash
cat $HOME/dotfiles/vscode/extensions | xargs -L 1 echo code --install-extension | sh

ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
```

## asdf

```bash
asdf plugin-add python
asdf plugin-add nodejs

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install python [version] # i.e. 3.7.3
asdf install nodejs [version] # i.e. 10.16.0

asdf global python [version]
asdf global nodejs [version]
```

## [stow](https://www.gnu.org/software/stow/)

`stow bash git karabiner tmux vim`

## [cheat.sh](http://cheat.sh)

```bash
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh
```
