function lt --wraps=eza --description 'Show a two-level tree with details, icons, and Git status'
    command eza --tree --level=2 --long --icons --git $argv
end
