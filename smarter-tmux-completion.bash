_tmux_completion_session_names()
{
    COMPREPLY=( $(compgen -W "$(tmux list-sessions -F '#{session_name}')" -- $1) )
    return 0
}

_tmux_completion()
{
    local cur option
    cur="${COMP_WORDS[COMP_CWORD]}"
    option="${COMP_WORDS[COMP_CWORD-1]}"

    _tmux
    case ${option} in
      '-t')
        _tmux_completion_session_names ${cur}
        ;;
    esac
    return 0
}
complete -o bashdefault -o default -F _tmux_completion tmux
