# Filename:         ~/dotfiles/bashrc
# Last modified:    2013 12 04

echo "+++ .bashrc"

case $(uname -s) in
    "Linux")
        source ${HOME}/dotfiles/bashrc.linux
        ;;

    "Darwin")
        source ${HOME}/dotfiles/bashrc.osx
        ;;

    *)
        echo "Unknown kernel"
        exit 1
        ;;
esac
