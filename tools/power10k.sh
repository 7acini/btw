#!/bin/bash

# Instala o Zsh
sudo apt install zsh -y

# Exibe a versão do Zsh
zsh --version

# Define o Zsh como shell padrão
chsh -s /usr/bin/zsh 

# Exibe o shell atual
echo $SHELL

# Mensagem para o usuário
echo "Faça logout e login novamente se o Zsh não for reconhecido como shell padrão."

# Instala o Oh My Zsh (necessário ter o curl instalado)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Define o tema Agnoster como padrão
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Instala a fonte Powerline
sudo apt-get install fonts-powerline -y

# Instala o tema Powerlevel10k
sudo rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Define o tema Powerlevel10k no Zsh
sed -i 's/ZSH_THEME="agnoster"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Instala os plugins zsh-autosuggestions e zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Habilita os plugins no arquivo de configuração do Zsh
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

echo "Se o assistente de configuração do Powerlevel10k não iniciar automaticamente, execute:"
echo "p10k configure"
