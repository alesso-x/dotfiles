export DOTFILES_HOME=$HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# path
path=(
    $path
    $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin \
    $HOMEBREW_PREFIX/opt/gnu-getopt/bin \
    $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin \
    $DOTFILES_HOME/.bin
)

#
# Oh My Zsh
#

# Path to your oh-my-zsh installation.
export ZSH=$XDG_DATA_HOME/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Deliberately not loaded:
#   asdf  - broken since asdf 0.16 (the Go rewrite ships no asdf.sh for it to
#           source). Shims come from fish, which this shell is launched from.
#   fzf   - replaced by `fzf --zsh` below, the method fzf documents now
#   z     - replaced by zoxide below, shared with fish
plugins=(
    colored-man-pages
    git
    history-substring-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# This shell is always launched from fish, so PATH already carries Homebrew
# and the asdf shims. Nothing below is guarded on purpose: if a tool goes
# missing the error should be visible, not silently swallowed.

# prompt
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"

# fzf
eval "$(fzf --zsh)"

# directory jumping
eval "$(zoxide init zsh)"

# pipx completions (requires `pipx install argcomplete`)
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# asdf java
. $ASDF_DATA_DIR/plugins/java/set-java-home.zsh # JAVA_HOME
