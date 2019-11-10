set -a

# XDG
XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_CACHE_HOME=$HOME/.cache

# ASDF
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
