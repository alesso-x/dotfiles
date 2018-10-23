# Delete merged branches, switch branch to master, git pull all repos in current working directory
function pull-repos
    find . -type d -depth 1 -exec git --git-dir='{}'/.git --work-tree=$PWD/'{}' delete-merged-branches \;
end
