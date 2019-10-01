# fish
set fish_greeting  # Disable fish greeting

# path
set -ax PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/opt/gnu-sed/libexec/gnubin \
    $HOME/.local/bin

# fzf
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
set -x FZF_FIND_FILE_COMMAND 'ag --hidden --ignore .git -g ""'
set -x FZF_CD_COMMAND 'ag --hidden --ignore .git -g ""'
set -x FZF_CD_WITH_HIDDEN_COMMAND 'ag --hidden --ignore .git -g ""'

# environment variables
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/.vimrc" | source $MYVIMRC'
fenv source ~/dotfiles/.environment_vars.sh

# aliases
bass source ~/dotfiles/.aliases.sh

# abbreviations -> abbr --list
if status --is-interactive
    abbr --add --global k kubectl
    abbr --add --global d docker
    abbr --add --global dm docker-compose
end

# direnv, asdf
eval (direnv hook fish)
source /usr/local/opt/asdf/asdf.fish

# gcloud
# set -ax PATH /usr/local/opt/gnu-getopt/bin  # brew install gnu-getopt
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# django completions
__fish_complete_django django-admin.py
__fish_complete_django manage.py

# pipx completions
register-python-argcomplete --shell fish pipx | .
