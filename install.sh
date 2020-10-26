#!/bin/sh

echo "
	Escolhar uma opção:\n
	1-Instalar pacotes
	2-Configurar
"
read opcao

if [ $opcao = 1 ]; then
	sudo apt update
	sudo apt full-upgrade -y
	sudo apt install zsh tmux neovim gitg fonts-powerline snapd flatpak -y
	sudo usermod -s /bin/zsh $(whoami)
	sudo snap install android-studio --classic
	sudo snap install insomnia
	sudo -k
	flatpak install flathub com.spotify.Client -y
else 
	# Install the font FiraCode
	mkdir ~/.local/share/fonts
	curl -fLo ~/.local/share/fonts/"Fira Code Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf

	#Define theme for the gnome-terminal
	dconf load /org/gnome/terminal/ < terminal_settings_backup.txt

	#Neovim
	if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
		echo "Vim-plug installed for neovim"
	else 
		echo "Installing Vim-plug"
		sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		rm ~/.config/nvim/init.vim
		ln -s $(pwd)/init.vim ~/.config/nvim/init.vim
	fi

	#TMUX
	if [ -f "~/.tmux.config" ]; then
		echo "TMUX Ok"
	else
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		ln -s $(pwd)/tmux.conf ~/.tmux.conf
	fi

	#Oh My Zsh
	if [ -d "~/.oh-my-zsh" ]; then
		echo "Oh My Zsh installed"
	else
		echo "Installing Oh My Zsh"
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		rm ~/.zshrc
		ln -s $(pwd)/zshrc ~/.zshrc
	fi
fi

