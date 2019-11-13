set -a

# XDG
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
                                  # Darwin
XDG_CONFIG_HOME=$HOME/.config     # $HOME/Library/Preferences (helm)  $HOME/Library/Application Support (doctl)
XDG_DATA_HOME=$HOME/.local/share  # $HOME/Library
XDG_CACHE_HOME=$HOME/.cache       # $HOME/Library/Caches

# AWS XDG
# https://github.com/aws/aws-cli/issues/2433#issuecomment-532208981
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"

# ASDF XDG
ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/.asdfrc
ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$XDG_CONFIG_HOME/asdf/.tool-versions

# GCloud
CLOUDSDK_PYTHON=/usr/bin/python

# fzf
# https://github.com/jethrokuan/fzf#commands
FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
FZF_FIND_FILE_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_WITH_HIDDEN_COMMAND='ag --hidden --ignore .git -g ""'
