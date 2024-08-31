#
# ~/.bash_profile
#
LANG=en_US.UTF-8

[[ -f ~/.bashrc ]] && . ~/.bashrc
source ~/.bashrc

export PROMPT_COMMAND="$PROMPT_COMMAND;history -a; history -n"

. "$HOME/.cargo/env"

# Created by `pipx` on 2024-08-26 18:48:15
export PATH="$PATH:/home/amnestia/.local/bin"
