#!/bin/sh

CURRENT_DIR=$(pwd)

echo "
	Choose an option:\n
	1-Install packages
	2-To set up
	3-Exit
"
read opcao

if [ $opcao = 1 ]; then

	sudo pacman -Syu &&
	sudo pacman -S curl zsh tmux neovim gitg nodejs powerline-fonts flatpak ranger -y &&
	sudo usermod -s /bin/zsh $(whoami) &&
	sudo -k
	flatpak install flathub com.google.AndroidStudio com.getpostman.Postman com.spotify.Client -y

elif [ $opcao = 2 ]; then

	# Install the font FiraCode
	mkdir ~/.local/share/fonts
	curl -fLo ~/.local/share/fonts/"Fantasque Sans Mono Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete.ttf

	#Define theme for the gnome-terminal
	dconf load /org/gnome/terminal/ < terminal_settings_backup.txt

	#Neovim
	if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
		echo "Vim-plug installed for neovim"
	else 
		echo "Installing Vim-plug"
		sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		rm ~/.config/nvim/init.vim
		ln -s $CURRENT_DIR/init.vim ~/.config/nvim/init.vim 
	fi	

	#Ranger
	if [ -f "~/.config/ranger/rc.conf" ]; then
		echo "Configured Ranger"
	else
		echo "Configuring the ranger"
		ranger --copy-config=all
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
		rm ~/.config/ranger/rc.conf
		ln -s $CURRENT_DIR/rc.conf ~/.config/ranger/rc.conf
	fi

	#TMUX
	if [ -f "~/.tmux.config" ]; then
		echo "Configured TMUX"
	else
		echo "Configuring the TMUX"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		ln -s $CURRENT_DIR/tmux.conf ~/.tmux.conf
	fi

	#Oh My Zsh
	if [ -d "~/.oh-my-zsh" ]; then
		echo "Oh My Zsh is installed"
	else
		echo "Installing Oh My Zsh"
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		rm ~/.zshrc
		ln -s $CURRENT_DIR/zshrc ~/.zshrc
	fi
else 
	echo "Bye bye"
fi

