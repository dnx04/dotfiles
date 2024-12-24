if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf_configure_bindings --directory=\ed --git_status=\eg --git_log=\el --history=\eh --variables=\ev --processes=\ep
atuin init fish | source
set -gx GPG_TTY (tty)
