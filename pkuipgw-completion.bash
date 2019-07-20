_pkuipgw_completion_main ()
{
    COMPREPLY=()
    local cmd0=${COMP_WORDS[0]}
    local cur=${COMP_WORDS[$COMP_CWORD]}
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "connect disconnect kick" -- $cur) )
    elif [[ $COMP_CWORD -eq 2 ]]; then
        local cmd1=${COMP_WORDS[1]}
        if [[ $cmd1 =~ (connect|disconnect) ]]; then
            COMPREPLY=( $(compgen -W "all" -- $cur) )
        fi
    fi
}

complete -F _pkuipgw_completion_main pkuipgw
