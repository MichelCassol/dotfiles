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

	echo "Atulizando o sistema"
	sudo pacman -Syu > /dev/null

	echo "Instalando os pacotes do pacman"
	sudo pacman -S \
		curl \
		fish \
		neovim \
		gitg \
		nodejs \
		powerline-fonts \
		flatpak \
		ranger \
		wl-clipboard \
		firefox \
		-y > /dev/null

	echo "Fish devinido como shell principal do usuário"
	sudo chsh --shell /bin/fish $(whoami) > /dev/null
	sudo -k

	echo "Instalando os pacotes flatpak"
	flatpak install flathub \
		rest.insomnia.Insomnia \
		com.spotify.Client \
		it.mijorus.gearlever \
		page.codeberg.libre_menu_editor.LibreMenuEditor \
		com.mattjakeman.ExtensionManager
		-y

elif [ $opcao = 2 ]; then

	# # Install the font FiraCode
	echo "Instalando a font Fantasque Sans Mono"
	mkdir ~/.local/share/fonts > /dev/null
	curl -fLo ~/.local/share/fonts/"Fantasque Sans Mono Nerd Font.ttf" \
		https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete.ttf \
		> /dev/null

	#Set keybindings on gnome
	echo "Configurando o Gnome"
	dconf load / < gnome-keybinds.conf > /dev/null

	#Neovim
	if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
		echo "Vim-plug installed for neovim"
	else 
		echo "Configurando o Neovim"
		sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null
		rm ~/.config/nvim/init.vim > /dev/null
		ln -s $CURRENT_DIR/init.vim ~/.config/nvim/init.vim > /dev/null
		echo "Neovim configurado"
	fi	

	#Ranger
	if [ -f "$HOME/.config/ranger/rc.conf" ]; then
		echo "Configured Ranger"
	else
		echo "Configurando o Ranger"
		ranger --copy-config=all > /dev/null
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons > /dev/null
		rm ~/.config/ranger/rc.conf > /dev/null
		ln -s $CURRENT_DIR/rc.conf ~/.config/ranger/rc.conf > /dev/null
		echo "Ranger configurado"
	fi

	#Fish
	if grep -q "My Fish Config" "$HOME/.config/fish/config.fish"; then
		echo "Configured Fish"
	else
		echo "Configuring Fish"
		rm ~/.config/fish/config.fish > /dev/null
		ln -s $CURRENT_DIR/config.fish ~/.config/fish/config.fish > /dev/null
		echo ""
	fi
else 
	echo "Bye bye"
fi

