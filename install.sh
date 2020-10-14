#!/bin/sh

echo "
	Escolhar uma opção:\n
	1-Instalar pacotes
	2-Configurar
"
read opcao

if [ $opcao = 1 ]; then
	sudo apt update
	sudo apt upgrade -y
	sudo apt install zsh tmux neovim
else 

	# curl -fLo "Fira Code Nerd Font Complete.otf" \https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Fira20%Code/complete/Fira20%Code%20Nerd%20Font%20Complete.otf

	#Define theme for the gnome-terminal
	dconf load /org/gnome/terminal/ < terminal_settings_backup.txt

	#Neovim
	if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
		echo "Vim-plug installed for neovim"
	else 
		echo "Installing Vim-plug"
		sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		rm ~/.config/nvim/init.vim
		ln -s init.vim ~/.config/nvim/init.vim
	fi

	#Oh My Zsh
	if [ -d "~/.oh-my-zsh" ]; then
		echo "Oh My Zsh installed"
	else
		echo "Installing Oh My Zsh"
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		rm ~/.zshrc
		ln -s zshrc ~/.zshrc
	fi

	#TMUX
	if [ -f "~/.tmux.config" ]; then
		echo "TMUX Ok"
	else
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		rm ~/.tmux.config
		ln -s tmux.config ~/.tmux.config
	fi
fi

