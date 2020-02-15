export DOTFILES_HOME=$HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# path
path=(
    $path
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-getopt/bin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
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
plugins=(
    asdf
    colored-man-pages
    fzf
    git
    shrink-path
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# path with shrink-path
setopt prompt_subst
PS1='%{$fg[cyan]%}$(shrink_path --fish) $(git_prompt_info)'
PS1+='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜)%{$reset_color%}'

# direnv
eval "$(direnv hook zsh)"

# pipx completions
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# asdf java
. $ASDF_DATA_DIR/plugins/java/set-java-home.sh # JAVA_HOME
