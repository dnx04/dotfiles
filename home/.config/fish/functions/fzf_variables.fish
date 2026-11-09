function fzf_variables
    set -l selection (
        for name in (set --names)
            printf '%s\t%s\n' "$name" (string join ' ' -- (string escape -- $$name))
        end | command fzf --prompt='Variable> '
    )
    if test -n "$selection"
        set -l name (string split -m 1 \t -- "$selection")[1]
        commandline --insert -- '$'"$name"
    end
    commandline --function repaint
end
