set -a

# XDG
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_CACHE_HOME=$HOME/.cache

# AWS XDG
# https://github.com/aws/aws-cli/issues/2433#issuecomment-532208981
AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
AWS_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_CONFIG_HOME/aws/token"
AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/shared-credentials"

# ASDF XDG
ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/.asdfrc
ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$XDG_CONFIG_HOME/asdf/.tool-versions

# GCloud
CLOUDSDK_PYTHON=/usr/local/bin/python2

# fzf
# https://github.com/jethrokuan/fzf#commands
FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
FZF_FIND_FILE_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_WITH_HIDDEN_COMMAND='ag --hidden --ignore .git -g ""'
