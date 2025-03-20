#!/bin/bash

sudo pacman -Syyuu

# COLOR USE THE SCRIPT
Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'
NC='\033[0m'
blue='\033[0;34m'
white='\033[0;37m'
lred='\033[0;31m'
IWhite="\[\033[0;97m\]"

# VARIABLE DATABASE AND OTHER THINGS
USERNAME=$(whoami)
LOCALPATH="/home/${USERNAME}"
KERNEL=$(uname -r)
DISTRIBUTION=$(uname -o)
HOST=$(uname -n)
BIT=$(uname -m)
RUTE=$(pwd)
FDIR=$(${LOCALPATH}/.local/share/fonts/)

# SCRIPT PRESENTATION
banner () {
echo -e "${White} ╔───────────────────────────────────────────────╗                 	"
echo -e "${White} |${Cyan} ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗${White} |      "
echo -e "${White} |${Cyan} ██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║${White} |      "
echo -e "${White} |${Cyan} ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║${White} |      "
echo -e "${White} |${Cyan} ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║${White} |	"
echo -e "${White} |${Cyan} ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║${White} |	"
echo -e "${White} |${Cyan} ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝${White} |	"
echo -e "${White} ┖───────────────────────────────────────────────┙			"
echo ""
echo -e "${White} [${Blue}i${White}] BSPWM | Hacker environment automation script."
echo -e "${White} [${Blue}i${White}] Michael Alves ( Al4xs ) or Sung jin woo and Guilherme Facini ( 7acini )"
echo ""
echo -e "${White} [${Blue}i${White}] Installation will begin soon."
echo ""
sleep 4
echo -e "${White} [${Blue}i${White}] Hello ${Red}${USERNAME}${White}, This is the bspwm installation script for kali linux"
}

# INSTALLATION OF MISSING DEPENDENCIES
missing_dependencies () {
echo ""
sudo pacman -Syyuu
echo -e "${White} [${Blue}i${White}] Step 9 installing missing dependencies"
sleep 2
echo ""
sudo pacman -S rofi fonts-firacode fonts-cantarell lxappearance nitrogen  git net-tools xclip open-vm-tools open-vm-tools-desktop
echo ""
sudo pacman -S openvpn feh pulseaudio-utils git
echo "Install my favorite tools"
sudo pacman -S flameshot htop neofetch

}

# INSTALL BSPWM SETUP
setup () {
clear
echo ""
banner
sleep 1
echo -ne "${White} [${Blue}!${White}] Do you want to continue with the installation? Y|N ▶ ${Red}"
read quest


if [[ $quest == "y" || $quest == "yes" || $quest == "Y" ]]; then
	echo ""
	echo -e "${White} [${Blue}i${White}] Step 1 checking if bspwm and sxhkd are installed"
	sleep 2
	if which bspwm >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] BSPWM is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/bspwm
		cp -r bspwm ${LOCALPATH}/.config/bspwm
		chmod +x ${LOCALPATH}/.config/bspwm/bspwmrc
	else
		echo ""
		echo -e "${White} [${Red}-${White}] BSPWM is not installed, installing bspwm"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S bspwm
		echo ""
		echo -e "${White} [${Blue}+${White}] BSPWM is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/bspwm
                cp -r bspwm ${LOCALPATH}/.config/bspwm
		chmod +x ${LOCALPATH}/.config/bspwm/bspwmrc
	fi
	if which sxhkd >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] SXHKD is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/sxhkd
		cp -r sxhkd ${LOCALPATH}/.config/sxhkd
		chmod +x ${LOCALPATH}/.config/sxhkd/sxhkdrc
	else
		echo ""
		echo -e "${White} [${Red}-${White}] SXHKD is not installed, installing sxhkd"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S sxhkd
		echo ""
		echo -e "${White} [${Blue}+${White}] SXHKD is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/sxhkd
                cp -r sxhkd ${LOCALPATH}/.config/sxhkd
                chmod +x ${LOCALPATH}/.config/sxhkd/sxhkdrc
	fi
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 2 installing fonts"
		sleep 2
		echo ""
		echo -e "${White} [${Blue}+${White}] Installing configuration, the fonts"
		sleep 3
		echo ""
		cd ${RUTE}/dotfiles
		sudo rm -rf ${LOCALPATH}/.fonts
		cp -r .fonts ${LOCALPATH}
		sudo cp -r .fonts /usr/share/fonts
		echo -e "${White} [${Blue}+${White}] Installed fonts"
		sleep 2
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 3 check if the kitty terminal is installed"
		sleep 2

	if which kitty >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] KITTY is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/kitty
                cp -r kitty ${LOCALPATH}/.config/kitty
	else
		echo ""
		echo -e "${White} [${Red}-${White}] KITTY is not installed, installing kitty"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S kitty
		echo ""
		echo -e "${White} [${Blue}+${White}] KITTY is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/kitty
                cp -r kitty ${LOCALPATH}/.config/kitty
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 4 check if the picom compositor is installed"
		sleep 2
	fi
	if which picom >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] PICOM is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/picom
                cp -r picom ${LOCALPATH}/.config/picom
	else
		echo ""
		echo -e "${White} [${Red}-${White}] PICOM is not installed, installing picom compositor"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S picom
		echo ""
		echo -e "${White} [${Blue}+${White}] PICOM is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
                sudo rm -rf ${LOCALPATH}/.config/picom
                cp -r picom ${LOCALPATH}/.config/picom
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 5 check if the neofetch is installed"
		sleep 2
	fi
	if which neofetch >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] NEOFETCH is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/neofetch
                cp -r neofetch ${LOCALPATH}/.config/neofetch
	else
		echo ""
		echo -e "${White} [${Red}-${White}] NEOFETCH is not installed, installing neofetch"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S neofetch
		echo ""
		echo -e "${White} [${Blue}+${White}] NEOFETCH is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/neofetch
                cp -r neofetch ${LOCALPATH}/.config/neofetch
                echo ""
                echo -e "${White} [${Blue}i${White}] Step 6 check if the ranger is installed"
                sleep 2
	fi
	if which ranger >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] RANGER is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/ranger
                cp -r ranger ${LOCALPATH}/.config/ranger
	else
		echo ""
		echo -e "${White} [${Red}-${White}] RANGER is not installed, installing ranger"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S ranger
		echo ""
		echo -e "${White} [${Blue}+${White}] RANGER is installed, installing configuration"
                sleep 2
                cd ${RUTE}/dotfiles/.config
                sudo rm -rf ${LOCALPATH}/.config/ranger
                cp -r ranger ${LOCALPATH}/.config/ranger
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 7 check if the cava is installed"
                sleep 2
	fi
	if which cava >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] CAVA is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
		sudo rm -rf ${LOCALPATH}/.config/cava
                cp -r cava ${LOCALPATH}/.config/cava
	else
		echo ""
		echo -e "${White} [${Red}-${White}] CAVA is not installed, installing cava"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S cava
		echo ""
		echo -e "${White} [${Blue}+${White}] CAVA is installed, installing configuration"
		sleep 2
                cd ${RUTE}/dotfiles/.config
                sudo rm -rf ${LOCALPATH}/.config/cava
                cp -r cava ${LOCALPATH}/.config/cava
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 8 check if the polybar is installed"
		sleep 2
	fi
	if which polybar >/dev/null; then
		echo ""
		echo -e "${White} [${Blue}+${White}] POLYBAR is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
                sudo rm -rf ${LOCALPATH}/.config/polybar
                cp -r polybar ${LOCALPATH}/.config/polybar
		chmod +x ${LOCALPATH}/.config/polybar/cuts/launch.sh
		chmod +x ${LOCALPATH}/.config/polybar/cuts/scripts/*.sh
	else
		echo ""
		echo -e "${White} [${Red}-${White}] POLYBAR is not installed, installing polybar"
		sleep 2
		echo ""
		sudo pacman -Syyuu
		echo ""
		sudo pacman -S polybar
		echo ""
		echo -e "${White} [${Blue}+${White}] POLYBAR is installed, installing configuration"
		sleep 2
		cd ${RUTE}/dotfiles/.config
                sudo rm -rf ${LOCALPATH}/.config/polybar
                cp -r polybar ${LOCALPATH}/.config/polybar
		chmod +x ${LOCALPATH}/.config/polybar/launch.sh
		chmod +x ${LOCALPATH}/.config/polybar/cuts/scripts/*.sh
	fi

##############################################################################################
# Necessary instalation

        if locate Nerd-Font-Complete >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Nerd-Font is installed"
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Nerd-Font is not installed, installing Nerd-Fonts"
                sleep 2
                echo ""
                cp -r ${RUTE}/dotfiles/home/fonts/* $FDIR
                sleep 2
        fi
        if [[ -d ~/Wallpapers ]]; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Wallpapers is installed, installing configuration"
                sleep 2
                cp -r ${RUTE}/dotfiles/home/Wallpapers/* ~/Wallpapers
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Wallpapers is not installed, installing Wallpapers"
                cp -r ${RUTE}/dotfiles/home/Wallpapers ~/
                sleep 2
        fi
        if which lightdm >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Lightdm is installed, installing screenlogin configs"
                sleep 2
                sudo cp -rv ~/Wallpapers/perfil.jpeg /usr/share/backgrounds/kali
                sudo cp -rv ~/Wallpapers/screenlogin.png /usr/share/backgrounds/kali
                sudo cp -r ${RUTE}/dotfiles/home/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Lightdm is not installed, installing screenlogin configs"
                sleep 2
                sudo cp -rv ~/Wallpapers/perfil.jpeg /usr/share/backgrounds/kali
                sudo cp -rv ~/Wallpapers/screenlogin.png /usr/share/backgrounds/kali
                sudo cp -r ${RUTE}/dotfiles/home/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
                sleep 2
        fi

        if which firefox >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] Firefox is installed, installing Theme configuration"
                sudo cp -r ${RUTE}/dotfiles/home/firefox/chrome/ "$(locate xulstore.json | grep '.mozilla/firefox' | cut -d '/' -f 1-6)/"
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] Firefox is not installed, installing Firefox"
                sudo pacman -S firefox
                sudo cp -r ${RUTE}/dotfiles/home/firefox/chrome/ "$(locate xulstore.json | grep '.mozilla/firefox' | cut -d '/' -f 1-6)/"
                sleep 2
        fi

        if which gf >/dev/null; then
                echo ""
                echo -e "${White} [${Blue}+${White}] gf is installed, installing more templates gf"
                cp -r ${RUTE}/dotfiles/home/.gf ~/
                cp -r ${RUTE}/dotfiles/home/.gf-completions ~/
                sleep 2
        else
                echo ""
                echo -e "${White} [${Red}-${White}] gf is not installed, installing gf"
                cp -r ${RUTE}/dotfiles/home/.gf ~/
                cp -r ${RUTE}/dotfiles/home/.gf-completions ~/
                sleep 2
        fi
                
##################################### INSTALL THEMES

		missing_dependencies
		echo -e "${White} [${Blue}i${White}] Step 11 installing bspwm scripts"
		sleep 2
		cd ${RUTE}/dotfiles
		cp -r scripts ${LOCALPATH}/.scripts
		chmod +x ${LOCALPATH}/.scripts/*.sh
		chmod +x ${LOCALPATH}/.scripts/wall-scripts/*.sh
		echo ""
		echo -e "${White} [${Blue}i${White}] Step 12 Installing the powerlevel10k, fzf, sudo-plugin, and others for the normal user"
		sleep 2
		echo ""
		cd ${RUTE}/dotfiles
		rm -rf ~/.zshrc; rm -rf ~/.p10k.zsh
		cp -r .zshrc .p10k.zsh ~/
                sudo rm -rf /usr/share/zsh-sudo/
		cd /usr/share ; sudo mkdir -p zsh-sudo
		cd zsh-sudo ; sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh 2>/dev/null
		rm -rf ~/.powerlevel10k
		cd ; git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k 2>/dev/null
		echo ""
		sudo rm -rf ${LOCALPATH}/.scripts/shell-color-scripts
		cd ${LOCALPATH}/.scripts ; git clone https://github.com/charitarthchugh/shell-color-scripts.git 2>/dev/null
		chmod +x ${LOCALPATH}/.scripts/shell-color-scripts/colorscripts/*
		sudo cp -r shell-color-scripts /opt/
		cd
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 2>/dev/null
		~/.fzf/install
		echo ""

		echo -e "${White} [${Blue}i${White}] Install pipes"
		sleep 2
		cd ${LOCALPATH}/.scripts ; rm -rf pipe*
		cd ${LOCALPATH}/.scripts ; git clone https://github.com/pipeseroni/pipes.sh.git 2>/dev/null
		echo ""
		echo "instalando sudo"
		sudo ./root.sh


fi
}

# CALLS THE SCRIPT
reset
setup
