# fzf installed through OMF but keybindings not working, copied the file
# https://github.com/jethrokuan/fzf/blob/master/conf.d/fzf_key_bindings.fish
bind \co '__fzf_find_file'
bind \cr '__fzf_reverse_isearch'
bind \ec '__fzf_cd'
bind \eC '__fzf_cd --hidden'
bind \eO '__fzf_open'
bind \eo '__fzf_open --editor'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \co '__fzf_find_file'
    bind -M insert \cr '__fzf_reverse_isearch'
    bind -M insert \ec '__fzf_cd'
    bind -M insert \eC '__fzf_cd --hidden'
    bind -M insert \eO '__fzf_open'
    bind -M insert \eo '__fzf_open --editor'
end

if set -q FZF_COMPLETE
    bind \t '__fzf_complete'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \t '__fzf_complete'
    end
end
