#!/bin/bash
if [[ ! -d ${HOME}/.config/nvim ]]; then
	mkdir -p ${HOME}/.config/nvim
fi
if [[ ! -d ${HOME}/.config/lvim/lua ]]; then
	mkdir -p ${HOME}/.config/lvim/lua
fi
# check weather you provided xstow , it first , if you not , i will use stowsh ,refuse use stow
replace_flag="-f"
if [[ -z $(which xstow) ]]; then
	echo "xstow not found, using stowsh instead"
	replace_flag="-s"
	alias xstow=stowsh
fi
xstow -v -t ~/.config/nvim neovim ${replace_flag}
xstow -v -d neovim -t ~/.config/lvim/lua lua ${replace_flag}
xstow -v -t ~ zsh ${replace_flag}
xstow -v -t ~ tmux ${replace_flag}
xstow -v -t ~/.zxhtom toms ${replace_flag}
# why git status *1 , I Dont know
