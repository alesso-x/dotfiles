function dj --wraps docker-compose
    # TODO: check for arg "upd" and use the USE_CONTAINERS
    genv -C $HOME/workspace/dev/ docker-compose --env-file $HOME/workspace/dev/.env $argv
end
