# ensure history without duplicates
HISTCONTROL=ignoreboth

[ "$TERM" = screen -a -n "$PROMPT_COMMAND" ] && export PROMPT_COMMAND=""

ph() { pygmentize $1 | less; }

# ssh-agent
keys=~/.ssh/deex*.key
ssh-add $keys &>/dev/null \
|| eval $(ssh-agent) >/dev/null \
|| echo cannot start ssh agent
ssh-add $keys &>/dev/null \
|| echo no ssh keys
unset keys
