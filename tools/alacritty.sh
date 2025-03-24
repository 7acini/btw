#!/bin/bash

banner() {
    echo " █████╗ ██╗      █████╗  ██████╗██████╗ ██╗████████╗████████╗██╗   ██╗"
    echo "██╔══██╗██║     ██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝"
    echo "███████║██║     ███████║██║     ██████╔╝██║   ██║      ██║    ╚████╔╝ "
    echo "██╔══██║██║     ██╔══██║██║     ██╔══██╗██║   ██║      ██║     ╚██╔╝  "
    echo "██║  ██║███████╗██║  ██║╚██████╗██║  ██║██║   ██║      ██║      ██║   "
    echo "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   "
    echo "                                              Created by @7acini      "

}

install_alacritty() {
    if ! command -V alacritty; then

        sudo apt install alacritty -y

    else
        echo "Alacritty já Instalado"

    fi    
}

confirm_installation() {
    while true; do
        read -p "Você deseja instalar o Alacritty [Y/n]: " resposta
        case $resposta in
            [Yy]* )
                echo "Iniciando a instalação..."
                install_alacritty
                break
                ;;
            [Nn]* )
                echo "Instalação cancelada."
                exit 0
                ;;
            * )
                echo "Opção inválida. Por favor, responda com 'Y' para sim ou 'n' para não."
                # Nenhum break ou exit aqui, pois o loop continua até uma entrada válida
                ;;
        esac
    done
}

banner
confirm_installation