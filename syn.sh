if [[ ! -d ${HOME}/.config/nvim ]]
then
  mkdir -p ${HOME}/.config/nvim
fi
if [[ ! -d ${HOME}/.config/lvim/lua ]]
then
  mkdir -p ${HOME}/.config/lvim/lua
fi
xstow -v -t ~/.config/nvim neovim -f 
xstow -v -d neovim -t ~/.config/lvim/lua lua -f 
xstow -v -t ~ zsh -f 
xstow -v -t ~ tmux -f 
xstow -v -t ~/.zxhtom toms -f 
