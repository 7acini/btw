#!/bin/bash

banner() {
    echo "███████╗████████╗ █████╗ ██████╗ ███████╗██╗  ██╗██╗██████╗ "
    echo "██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║  ██║██║██╔══██╗"
    echo "███████╗   ██║   ███████║██████╔╝███████╗███████║██║██████╔╝"
    echo "╚════██║   ██║   ██╔══██║██╔══██╗╚════██║██╔══██║██║██╔═══╝ "
    echo "███████║   ██║   ██║  ██║██║  ██║███████║██║  ██║██║██║     "
    echo "╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     "
}

install_starship() {
    if ! command -V starship; then

        curl -sS https://starship.rs/install.sh | sh
        echo eval "$(starship init zsh)" >> ~/.zshrc

    else
        echo "Starship já Instalado"

    fi
}

banner
install_starship