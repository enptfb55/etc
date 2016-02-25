# Filename:      ~/dotfiles/bashrc
# Last modified: 2016.02.24


case ${OSTYPE} in
    "linux-gnu")
        source ${HOME}/dotfiles/bashrc.linux
        ;;

    "darwin"*)
        source ${HOME}/dotfiles/bashrc.osx
        ;;

    *)
        echo ".bashrc: Unknown kernel"
        exit 1
        ;;
esac
