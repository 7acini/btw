#!/bin/bash

banner() {
    echo "██╗      █████╗ ███████╗██╗   ██╗ ██████╗ ██╗████████╗"
    echo "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██╔════╝ ██║╚══██╔══╝"
    echo "██║     ███████║  ███╔╝  ╚████╔╝ ██║  ███╗██║   ██║   "
    echo "██║     ██╔══██║ ███╔╝    ╚██╔╝  ██║   ██║██║   ██║   "
    echo "███████╗██║  ██║███████╗   ██║   ╚██████╔╝██║   ██║   "
    echo "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝   ╚═╝   "
}

install_golang() {
    # Verifica se o Go (Golang) está instalado
    if ! command -v go &> /dev/null; then
        echo "Go não está instalado. Instalando..."
        # Adicionando repositório do Go
        wget https://dl.google.com/go/go1.20.3.linux-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz
        export PATH=$PATH:/usr/local/go/bin
        echo "Go instalado com sucesso!"
    else
        echo "Go já está instalado."
    fi
}

install_lazygit() {
    # Verifica se o lazygit está instalado
    if ! command -v lazygit &> /dev/null; then
        echo "lazygit não encontrado. Instalando..."

        # Clona o repositório do lazygit
        git clone https://github.com/jesseduffield/lazygit.git
        cd lazygit

        # Instala o lazygit usando go
        go install

        echo "lazygit instalado com sucesso!"
    else
        echo "lazygit já está instalado."
    fi

    echo "Instalação concluída! Você pode rodar o lazygit com o comando 'lazygit'."
}

banner
install_golang
install_lazygit