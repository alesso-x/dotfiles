export DOTFILES_HOME=$HOME/dotfiles

source $DOTFILES_HOME/.environment_vars.sh
source $DOTFILES_HOME/.aliases.sh
export HISTFILE=$XDG_DATA_HOME/bash/history

# prompt
eval "$(starship init bash)"
# PS1="\[\e[0;31m\]\u \[\e[0;33m\]\W \[\e[0;32m\]$ \[\e[0m\]"

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

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# direnv, asdf
eval "$(direnv hook bash)"
source $HOMEBREW_PREFIX/opt/asdf/asdf.sh
. $ASDF_DATA_DIR/plugins/java/set-java-home.bash # JAVA_HOME

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
