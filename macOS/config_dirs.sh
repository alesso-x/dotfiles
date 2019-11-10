# XDG
mkdir $HOME/.config           # XDG_CONFIG_HOME
mkdir $HOME/.cache            # XDG_CACHE_HOME
mkdir -p $HOME/.local/share   # XDG_DATA_HOME

# ASDF
mkdir -p (dirname "$ASDF_CONFIG_FILE"); touch $ASDF_CONFIG_FILE
mkdir -p $ASDF_DATA_DIR
touch $ASDF_DEFAULT_TOOL_VERSIONS_FILENAME
