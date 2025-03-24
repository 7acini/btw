#!/bin/bash

banner() {
    echo "███████╗███████╗██╗  ██╗      ██████╗  ██╗ ██████╗ ██╗  ██╗"
    echo "╚══███╔╝██╔════╝██║  ██║      ██╔══██╗███║██╔═████╗██║ ██╔╝"
    echo "  ███╔╝ ███████╗███████║█████╗██████╔╝╚██║██║██╔██║█████╔╝ "
    echo " ███╔╝  ╚════██║██╔══██║╚════╝██╔═══╝  ██║████╔╝██║██╔═██╗ "
    echo "███████╗███████║██║  ██║      ██║      ██║╚██████╔╝██║  ██╗"
    echo "╚══════╝╚══════╝╚═╝  ╚═╝      ╚═╝      ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
}

install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo "Instalando o Zsh..."
        sudo apt update && sudo apt install zsh -y
    else
        echo "O Zsh já está instalado."
    fi
}

set_default_shell() {
    if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
        echo "Definindo o Zsh como shell padrão..."
        chsh -s /usr/bin/zsh
        echo "Por favor, faça logout e login novamente para que a alteração tenha efeito."
    else
        echo "O Zsh já é o shell padrão."
    fi
}

install_oh_my_zsh() {
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo "Instalando Oh My Zsh..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    else
        echo "Oh My Zsh já está instalado."
    fi
}

install_powerlevel10k() {
    if [[ ! -d "$HOME/.powerlevel10k" ]]; then
        echo "Instalando Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
    else
        echo "Powerlevel10k já está instalado."
    fi
}


banner
install_zsh
zsh --version
set_default_shell
install_oh_my_zsh
install_powerlevel10k
