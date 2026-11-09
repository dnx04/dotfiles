# User tools and runtimes.
fish_add_path "$HOME/.local/bin" "$HOME/.bun/bin"

# Shared Omarchy-style defaults.
set -gx SUDO_EDITOR "$EDITOR"
set -gx BAT_THEME ansi
set -g fish_greeting
set -gx FZF_DEFAULT_OPTS '--cycle --layout=default --height=90% --preview-window=wrap --marker="*"'

if command -q bat; and command -q col
    set -gx MANROFFOPT -c
    set -gx MANPAGER "sh -c 'col -bx | bat --color=always -l man -p'"
end

# Use Micromamba through the familiar conda command.
alias conda micromamba

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
if not set -q MAMBA_EXE; or not test -x "$MAMBA_EXE"
    set -l mise_mamba "$HOME/.local/share/mise/installs/micromamba/latest/bin/micromamba"
    if test -x "$mise_mamba"
        set -gx MAMBA_EXE "$mise_mamba"
        # Discard a stale root inherited from an unavailable installation.
        set -gx MAMBA_ROOT_PREFIX "$HOME/.local/share/mamba"
    else if command -q micromamba
        set -gx MAMBA_EXE (command -s micromamba)
    end
end
if not set -q MAMBA_ROOT_PREFIX; or not test -d "$MAMBA_ROOT_PREFIX"
    set -gx MAMBA_ROOT_PREFIX "$HOME/.local/share/mamba"
end
if set -q MAMBA_EXE; and test -x "$MAMBA_EXE"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
end
# <<< mamba initialize <<<

# Project hooks may activate Conda, so initialize mise after Micromamba.
if status is-interactive
    if command -q mise
        mise activate fish | source
    end
    if command -q zoxide
        zoxide init fish --cmd cd | source
    end
    if command -q fzf
        fzf --fish | source
        fish_user_key_bindings
    end
end

# Match Omarchy's prompt; initialize after the environment manager.
if status is-interactive; and command -q starship
    starship init fish | source
end
