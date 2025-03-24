#!/bin/bash

banner() {
    echo "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
	echo "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
	echo "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
	echo "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
	echo "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
	echo "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"                                                
}


install_nvim() {
    if ! command -v nvim; then

        sudo apt install neovim -y

    else
        echo "NeoVim já Instalado"

    fi 
}

configuring_nvim() {
    # Requerido
    echo "Fazendo backup da configuração do Neovim..."
    mv ~/.config/nvim{,.bak}

    # Opcional, mas recomendado
    echo "Fazendo backup dos diretórios locais do Neovim..."
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}

    # Clonar o starter do LazyVim
    echo "Clonando o repositório LazyVim..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim

    # Remover a pasta .git para poder adicionar o repositório ao seu próprio repositório depois
    echo "Removendo a pasta .git para personalizar com seu próprio repositório..."
    rm -rf ~/.config/nvim/.git
}

banner
install_nvim
configuring_nvim