#!/bin/bash

banner() {
    echo "████████╗███╗   ███╗██╗   ██╗██╗  ██╗"
    echo "╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝"
    echo "   ██║   ██╔████╔██║██║   ██║ ╚███╔╝ "
    echo "   ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ "
    echo "   ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
    echo "   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
}

install_tmux() {
    if ! command -V tmux; then

        sudo apt install tmux -y

    else
        echo "Tmux já Instalado"

    fi
}

banner
install_tmux