# XDG
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://golang.org/pkg/os/#UserConfigDir
#
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
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$XDG_CONFIG_HOME/asdf/.tool-versions

# GnuPG
# export GNUPGHOME=$XDG_DATA_HOME/gnupg

# Docker
# export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
