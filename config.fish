# My Fish Config

# Variables
set fish_greeting
set -x EDITOR 'nvim'
set -g fish_case_sensitive no

# Alias
alias update="sudo pacman -Syu && flatpak update -y"
# alias composer="docker run --rm --interactive --tty --volume $PWD:/app composer"

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Commands to run in interactive sessions can go here
if status is-interactive
	# Commands
end
