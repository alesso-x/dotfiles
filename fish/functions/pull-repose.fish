function pull-repos
    bass "find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} delete-merged-branches \;"
end
