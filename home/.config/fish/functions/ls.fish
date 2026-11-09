function ls --wraps=eza --description 'Omarchy long listing with icons and directories first'
    if command -q eza
        command eza -lh --group-directories-first --icons=auto $argv
    else
        command ls $argv
    end
end
