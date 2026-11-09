function fish_user_key_bindings --description 'Shared fuzzy finder shortcuts'
    if command -q fzf
        # Keep shortcuts in ordinary editing and vi insert mode.
        for keymap in default insert
            bind -M $keymap \cr fzf-history-widget
            bind -M $keymap \e\cp fzf_processes
            bind -M $keymap \e\cv fzf_variables
        end
    end
end
