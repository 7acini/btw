#!/bin/bash

DOTFILES_DIR="$(pwd)/dotfiles"
TOOLS_DIR="$(pwd)/tools"
HOME_DIR="$HOME"

banner(){
    echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     "
    echo "██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     "
    echo "██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     "
    echo "██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     "
    echo "██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗"
    echo "╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝"
    echo "                              Created by @7acini      "
}

# Função para confirmar a instalação
confirm_installation() {
    while true; do
        read -p "Você deseja prosseguir com a instalação [Y/n]: " resposta
        case $resposta in
            [Yy]* )
                echo "Iniciando a instalação..."
                install_tools
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


install_tools() {
    echo "Iniciando a instalação das ferramentas..."
    # Verifica se a pasta tools existe
    if [ -d "$TOOLS_DIR" ]; then
        for script in "$TOOLS_DIR"/*.sh; do
            clear
            # Verifica se existem scripts na pasta
            if [ -f "$script" ]; then
                # Executa cada script encontrado
                echo "Executando $script..."
                bash "$script"
                
            else
                echo "Nenhum script encontrado em $TOOLS_DIR"
            fi
        done
    else
        echo "A pasta $TOOLS_DIR não existe. Criando a pasta..."
        mkdir -p "$TOOLS_DIR"
        echo "Pasta $TOOLS_DIR criada. Por favor, adicione os scripts de instalação."
    fi
}

banner
confirm_installation
