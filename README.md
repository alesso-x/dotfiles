# dotfiles

## xcode

```bash
xcode-select --install
```

## [brew](https://brew.sh)

```bash
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
brew install mas
brew bundle --file=./macOS/Brewfile
```

## macOS

```bash
bash ./macOS/defaults.sh
bash ./macOS/dock.sh
```

## [fish shell](https://fishshell.com)

```bash
echo "$(command -v fish)" | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
bash ./setup.fish
```

## [vscode](https://code.visualstudio.com)

```bash
ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
cat $HOME/dotfiles/vscode/extensions | xargs -L 1 echo code --install-extension | sh
```

## [stow](https://www.gnu.org/software/stow/)

`stow bash fish git karabiner tmux vim`

## [cheat.sh](http://cheat.sh)

```bash
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh
```
