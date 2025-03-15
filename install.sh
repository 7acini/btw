#!/bin/bash

DOTFILES_DIR="$(pwd)/dotfiles"
TOOLS_DIR="$(pwd)/tools"
HOME_DIR="$HOME"

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
install_tools
