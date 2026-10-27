# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Match IDA's desktop Python environment when launching from a terminal.
source ~/.config/environment.d/50-hexrays-idapython-venv-executable.conf
export IDAPYTHON_VENV_EXECUTABLE

# Auto-launch fish shell if in interactive bash
if command -v fish &> /dev/null; then
	if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
	then
		shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
		exec fish $LOGIN_OPTION
	fi
fi

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions below.
