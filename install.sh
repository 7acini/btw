#!/bin/bash

DOTFILES_DIR="$(pwd)/dotfiles/home"
TOOLS_DIR="$(pwd)/tools"
HOME_DIR="$HOME"

# Função para exibir banner de início
echo_banner() {
    echo "====================================="
    echo "  Instalação e Configuração Iniciada  "
    echo "====================================="
}

# Função para criar links simbólicos dos arquivos de configuração
install_dotfiles() {
    echo "Configurando dotfiles..."
    
    for file in "$DOTFILES_DIR"/*; do
        filename=$(basename "$file")
        target="$HOME_DIR/.$filename"
        
        if [ -f "$target" ] || [ -L "$target" ]; then
            read -p "$target já existe. Deseja sobrescrever? (s/n): " choice
            if [ "$choice" != "s" ]; then
                echo "Ignorando $filename"
                continue
            fi
            rm -f "$target"
        fi
        
        ln -s "$file" "$target"
        echo "$filename vinculado a $target"
    done
}

# Função para instalar ferramentas
install_tools() {
    echo "Iniciando a instalação das ferramentas..."
    if [ -d "$TOOLS_DIR" ]; then
        for script in "$TOOLS_DIR"/*.sh; do
            clear
            if [ -f "$script" ]; then
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

echo_banner
install_tools
install_dotfiles

echo "Configuração concluída! Abra um novo terminal para aplicar as alterações."
