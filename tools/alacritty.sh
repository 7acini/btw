#!/bin/bash

banner() {
    echo " █████╗ ██╗      █████╗  ██████╗██████╗ ██╗████████╗████████╗██╗   ██╗"
    echo "██╔══██╗██║     ██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝"
    echo "███████║██║     ███████║██║     ██████╔╝██║   ██║      ██║    ╚████╔╝ "
    echo "██╔══██║██║     ██╔══██║██║     ██╔══██╗██║   ██║      ██║     ╚██╔╝  "
    echo "██║  ██║███████╗██║  ██║╚██████╗██║  ██║██║   ██║      ██║      ██║   "
    echo "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   "
}

install_alacritty() {
    if ! command -V alacritty; then

        sudo apt install alacritty -y

    else
        echo "Alacritty já Instalado"

    fi    
}

banner
install_alacritty
