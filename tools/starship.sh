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
        # Obtém o caminho do shell atual
        SHELL_PATH=$(echo "$SHELL")
        
        # Define o comando adequado com base no shell detectado
        case "$SHELL_PATH" in
            */bash)
                CONFIG_FILE="$HOME/.bashrc"
                echo 'eval "$(starship init bash)"' >> "$CONFIG_FILE"
                ;;
            */zsh)
                CONFIG_FILE="$HOME/.zshrc"
                echo 'eval "$(starship init zsh)"' >> "$CONFIG_FILE"
                ;;
            *)
                echo "Shell não suportado: $SHELL_PATH"
                exit 1
                ;;
        esac
        
        # Mensagem de sucesso
        echo "Configuração adicionada a $CONFIG_FILE. Reinicie o terminal ou execute 'source $CONFIG_FILE' para aplicar as mudanças."

    else
        echo "Starship já Instalado"

    fi
}

banner
install_starship