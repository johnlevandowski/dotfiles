alias jctl="journalctl -p 4 -xb"
alias pdmn="sudo machinectl shell john-podman@"
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'

upgrade_system() {
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt upgrade
    elif command -v dnf &> /dev/null; then
        sudo dnf upgrade
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu
    else
        echo "Error: No matching package manager found."
    fi
}
alias upgrade='upgrade_system'
