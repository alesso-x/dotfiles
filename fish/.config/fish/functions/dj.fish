function dj  --wraps docker-compose
    genv -C $HOME/workspace/dev/ docker-compose $argv
end
