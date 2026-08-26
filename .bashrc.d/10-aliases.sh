alias jctl="journalctl -p 4 -xb"
alias pdmn="sudo machinectl shell john-podman@"
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lahZ --color=auto'
    alias grep='grep --color=auto'
fi

upgrade_system() {
    if command -v apt &> /dev/null; then
        echo "#########################################"
        echo "## sudo apt update && sudo apt upgrade ##"
        echo "#########################################"
        sudo apt update && sudo apt upgrade
    elif command -v dnf &> /dev/null; then
        echo "######################"
        echo "## sudo dnf upgrade ##"
        echo "######################"
        sudo dnf upgrade
    elif command -v pacman &> /dev/null; then
        echo "######################"
        echo "## sudo pacman -Syu ##"
        echo "######################"
        sudo pacman -Syu
    else
        echo "Error: No matching package manager found."
    fi

    if command -v flatpak &> /dev/null; then
        echo "#####################"
        echo "## flatpak upgrade ##"
        echo "#####################"
        flatpak upgrade
    fi
}
alias upgrade='upgrade_system'
