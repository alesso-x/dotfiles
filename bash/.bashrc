export DOTFILES_HOME=$HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh
export HISTFILE=$XDG_DATA_HOME/bash/history

# prompt
eval "$(starship init bash)"

# terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# man page colors
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# bash completion. bash-completion@2 (needs bash 4.2+, we run brew's bash 5.x);
# the v1 formula uses etc/bash_completion instead.
. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# direnv
eval "$(direnv hook bash)"

# fzf. `fzf --bash` replaces the old ~/.fzf.bash install method.
eval "$(fzf --bash)"

# directory jumping
eval "$(zoxide init bash)"

# asdf shims
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

. $ASDF_DATA_DIR/plugins/java/set-java-home.bash # JAVA_HOME
