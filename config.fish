# My Fish Config

# Variables
set fish_greeting
set -x EDITOR 'nvim'

# Alias
alias update="sudo pacman -Syu && flatpak update"

# Commands to run in interactive sessions can go here
if status is-interactive
	# Commands
end
