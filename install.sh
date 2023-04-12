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
	sudo pacman -S curl fish tmux neovim gitg nodejs powerline-fonts flatpak ranger wl-clipboard -y &&
	sudo chsh --shell /bin/fish $(whoami) &&
	sudo -k
	flatpak install flathub rest.insomnia.Insomnia com.spotify.Client -y

elif [ $opcao = 2 ]; then

	# # Install the font FiraCode
	mkdir ~/.local/share/fonts
	curl -fLo ~/.local/share/fonts/"Fantasque Sans Mono Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete.ttf

	#Set keybindings on gnome
	dconf load / < gnome-keybinds.conf

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
	if [ -f "$HOME/.config/ranger/rc.conf" ]; then
		echo "Configured Ranger"
	else
		echo "Configuring the ranger"
		ranger --copy-config=all
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
		rm ~/.config/ranger/rc.conf
		ln -s $CURRENT_DIR/rc.conf ~/.config/ranger/rc.conf
	fi

	#TMUX
	if [ -f "$HOME/.tmux.config" ]; then
		echo "Configured TMUX"
	else
		echo "Configuring the TMUX"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		ln -s $CURRENT_DIR/tmux.conf ~/.tmux.conf
	fi

	#Fish
	if grep -q "My Fish Config" "$HOME/.config/fish/config.fish"; then
		echo "Configured Fish"
	else
		echo "Configuring Fish"
		rm ~/.config/fish/config.fish
		ln -s $CURRENT_DIR/config.fish ~/.config/fish/config.fish
	fi
else 
	echo "Bye bye"
fi

