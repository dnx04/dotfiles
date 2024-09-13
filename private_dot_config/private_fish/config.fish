if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf_configure_bindings --directory=\ed --git_status=\eg --git_log=\el --history=\eh --variables=\ev --processes=\ep
zoxide init fish | source
atuin init fish | source
set -gx GPG_TTY (tty)

fish_add_path -a /home/dnx04/.foundry/bin

# Created by `pipx` on 2024-08-10 02:48:40
set PATH $PATH /home/dnx04/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx GEM_HOME "$(gem env user_gemhome)"
set -gx PATH $PATH $GEM_HOME/bin
