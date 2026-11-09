# Shared interactive Bash entry point.
case $- in
    *i*) ;;
    *) return ;;
esac

# Launch Fish for top-level interactive sessions, retaining Bash for SSH commands.
if command -v fish >/dev/null 2>&1 \
    && [[ $(ps --no-header --pid="$PPID" --format=comm) != fish ]] \
    && [[ -z ${BASH_EXECUTION_STRING:-} && ${SHLVL:-0} == 1 ]]; then
    if shopt -q login_shell; then
        exec fish --login
    else
        exec fish
    fi
fi
