if [ -z $OPENCV_VERSIONS_FILE ]; then
    OPENCV_VERSIONS_FILE=$HOME/etc/opencv-versions
fi

_completion_main ()
{
    COMPREPLY=()
    local cmd0=${COMP_WORDS[0]}
    local cur=${COMP_WORDS[$COMP_CWORD]}
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "install uninstall activate deactivate" -- $cur) )
    elif [[ $COMP_CWORD -eq 2 ]]; then
        local cmd1=${COMP_WORDS[1]}
        if [ $cmd1 = "activate" ]; then
            versions=$(awk '{ print $1 }' $OPENCV_VERSIONS_FILE)
            COMPREPLY=( $(compgen -W $versions -- $cur) )
        fi
    fi
}

complete -F _completion_main opencv-version-manager
