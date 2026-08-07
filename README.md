# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a stow package whose contents mirror `$HOME`.

fish is the login shell. zsh and bash are only ever launched from inside fish,
so they inherit `PATH` (Homebrew, GNU userland, asdf shims) rather than setting
it up themselves.

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

`.environment_vars.sh` sources `_private/vars.sh` and fish sources
`_private/local_config.fish`, so both files must exist before any shell starts.
Neither is tracked (`.gitignore` is `_*`) — this is where per-machine settings
live: `vars.sh` for env vars shared by all shells, `local_config.fish` for
fish-only setup.

```bash
mkdir -p $DOTFILES_HOME/_private
touch $DOTFILES_HOME/_private/vars.sh
touch $DOTFILES_HOME/_private/local_config.fish
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
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source \
    && fisher install jorgebucaran/fisher

# configuration
rm ~/.config/fish/config.fish
stow --adopt fish
fisher update

# docker completion
# Paths shift between Docker Desktop releases; check the app bundle first.
ln -sf /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion \
    ~/.config/fish/completions/docker.fish
```

## stow

```bash
stow asdf
stow bash
stow git
stow starship
stow vim
stow zsh
git lfs install
```

## vscode

```bash
# Command Pallet... > Shell Command: Install 'code' command in PATH

# for vscode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Manually link files until https://github.com/microsoft/vscode/issues/3884
export VSCODE_HOME="$HOME/Library/Application Support/Code/User"
ln -sf $DOTFILES_HOME/vscode/settings.json $VSCODE_HOME/settings.json
ln -sf $DOTFILES_HOME/vscode/keybindings.json $VSCODE_HOME/keybindings.json
ln -sf $DOTFILES_HOME/vscode/snippets/* $VSCODE_HOME/snippets/
```

`vscode/extensions` is **generated** — `dotdump` and `dotsync` overwrite it from
the `Personal` profile. Edit extensions in VSCode, then re-run `dotdump`; do not
hand-edit the file. To restore them on a new machine:

```bash
xargs -n 1 code --profile Personal --install-extension < $DOTFILES_HOME/vscode/extensions
```

## macOS

```bash
bash $DOTFILES_HOME/macOS/config_dirs.sh
bash $DOTFILES_HOME/macOS/defaults.sh
bash $DOTFILES_HOME/macOS/dock.sh
```

## xcode

```bash
# Set Xcode developer tools as the active developer directory
# Check with `xcode-select --print-path`
xcode-select -s /Applications/Xcode.app/Contents/Developer/
```

## asdf

```bash
# python
asdf plugin add python
asdf install python latest
asdf set --home python (asdf latest python)

# nodejs
asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs lts
asdf set --home nodejs (asdf latest nodejs)

# java
asdf plugin add java
asdf install java (asdf latest java openjdk)
asdf set --home java (asdf latest java openjdk)

# cli
# rm -rf ~/.local/pipx/ after upgrading python
pipx install soundscrape
pipx install ytmdl
pipx install argcomplete # required by pipx completions in zsh/.zshrc
```

## vim

```bash
stow vim
```

A deliberately minimal `.vimrc` — vim is the git editor and a scratch editor,
nothing more.

## iTerm2

`iterm/com.googlecode.iterm2.plist` is the source of truth. Point iTerm at the
folder and it both loads from and writes back to it.

```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_HOME/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

Then set the write-back to happen on its own, or changes made during a long
session only reach the repo when iTerm quits:

> Settings → General → Settings → **Save changes: Automatically**

iTerm's own write is cleaner than `defaults export com.googlecode.iterm2` —
it strips the transient `NoSync*` keys (323 keys vs 705). Don't swap it for a
`defaults export` in `dotdump`.

`Argonaut.itermcolors` is a portable color preset, importable elsewhere; the
plist only carries those colors embedded inside the profile.

## zsh

```bash
# open zsh before running these commands
export ZSH=$XDG_DATA_HOME/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
stow zsh

git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

## Maintenance

| command | what it does |
| --- | --- |
| `sysupdate` | upgrades brew, mas, pipx, asdf tools, fisher, and macOS |
| `dotdump` | writes the Brewfile and the VSCode extension list from the current machine |
| `dotsync` | pulls, reconciles brew + VSCode extensions in both directions, backs up fish history |
| `dotadd <pkg> <path>` | moves an existing file into a stow package and links it back |
| `dotrm <pkg>` | unstows a package |
