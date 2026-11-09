function fzf_processes
    set -l selection (command ps -eo pid,user,args | command fzf --header-lines=1 --prompt='Process> ')
    if test -n "$selection"
        set -l pid (string match -r '^\s*([0-9]+)' -- "$selection")[2]
        commandline --insert -- "$pid"
    end
    commandline --function repaint
end
