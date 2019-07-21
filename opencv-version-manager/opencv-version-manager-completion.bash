if [ -z $OPENCV_VERSIONS_PATH ]; then
    OPENCV_VERSIONS_PATH=$HOME/etc/opencv-versions
fi

_opencv_version_manager_completion_main ()
{
    COMPREPLY=()
    local cmd0=${COMP_WORDS[0]}
    local cur=${COMP_WORDS[$COMP_CWORD]}
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "install uninstall activate deactivate" -- $cur) )
    elif [[ $COMP_CWORD -eq 2 ]]; then
        local cmd1=${COMP_WORDS[1]}
        if [ $cmd1 = "activate" ]; then
            versions=($(ls $OPENCV_VERSIONS_PATH/*.conf | sed "s/\s\+/\n/g" | awk '{ cmd="basename "$0; system(cmd) }' | sed "s/.conf$//g"))
            COMPREPLY=( $(compgen -W "${versions[*]}" -- $cur) )
        fi
    fi
}

complete -F _opencv_version_manager_completion_main opencv-version-manager
