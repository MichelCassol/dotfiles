#!/bin/sh

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
	ln -s .zshrc ~/.zshrc
fi

#TMUX
if [ -f "~/.tmux.config" ]; then
	echo "TMUX Ok"
else
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s .tmux.config ~/.tmux.config
fi
