set -a

# GCloud
# https://cloud.google.com/sdk/docs/quickstart-macos
# gcloud topic startup
CLOUDSDK_PYTHON=/usr/bin/python

# fzf
# https://github.com/jethrokuan/fzf#commands
FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
FZF_FIND_FILE_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_COMMAND='ag --hidden --ignore .git -g ""'
FZF_CD_WITH_HIDDEN_COMMAND='ag --hidden --ignore .git -g ""'

set +x
