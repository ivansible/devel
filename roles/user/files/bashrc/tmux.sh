tt() {
    case "${1:-}" in
        [0-9])  tmux attach-session -t "$1" ;;
        '')     tmux attach-session ;;
        l*)     tmux list-sessions ;;
        n*)     tmux ;;
        -h|*)   echo "usage: tt [list|new|SESS]" ;;
    esac
}

alias ttsave='tmux capture-pane -p -S- -E- > tmux.out'
alias ttclear='tmux clear-history'
