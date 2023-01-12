# fzf
# https://github.com/jethrokuan/fzf#commands
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_FIND_FILE_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CD_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CD_WITH_HIDDEN_COMMAND='ag --hidden --ignore .git -g ""'

# https://github.com/b4b4r07/enhancd#configurations
export ENHANCD_DISABLE_DOT=1

# BREW
export HOMEBREW_PREFIX=/opt/homebrew

#
# XDG
#

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://golang.org/pkg/os/#UserConfigDir

                                         # Darwin
export XDG_CONFIG_HOME=$HOME/.config     # $HOME/Library/Preferences (helm)  $HOME/Library/Application Support (doctl)
export XDG_DATA_HOME=$HOME/.local/share  # $HOME/Library
export XDG_CACHE_HOME=$HOME/.cache       # $HOME/Library/Caches

# AWS XDG
# https://github.com/aws/aws-cli/issues/2433#issuecomment-532208981
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
# AWS Amplify does not support these variables
# export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
# export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials

# ASDF XDG
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/.asdfrc
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

# GnuPG
# export GNUPGHOME=$XDG_DATA_HOME/gnupg

# Docker
# export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

source $DOTFILES_HOME/_private/vars.sh
