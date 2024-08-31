#
# ~/.bash_profile
#
LANG=en_US.UTF-8

[[ -f ~/.bashrc ]] && . ~/.bashrc
source ~/.bashrc

export PROMPT_COMMAND="$PROMPT_COMMAND;history -a; history -n"

. "$HOME/.cargo/env"
