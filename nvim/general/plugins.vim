"    [ Marko Cerovac | Vim/NeoVim | Vim-Plug settings ]
"
"         ___           ___     
"        /\  \         /\__\    
"       |::\  \       /:/  /    
"       |:|:\  \     /:/  /     
"     __|:|\:\  \   /:/  /  ___ 
"    /::::|_\:\__\ /:/__/  /\__\
"    \:\~~\  \/__/ \:\  \ /:/  /
"     \:\  \        \:\  /:/  / 
"      \:\  \        \:\/:/  /  
"       \:\__\        \::/  /   
"        \/__/         \/__/    
"    

call plug#begin('~/.config/nvim/autoload/plugged')
"All plugins installed in:  [ ~/.config/nvim/autoload/plugged ]

"Color themes
Plug 'liuchengxu/space-vim-theme'						"Space vim
Plug 'joshdick/onedark.vim'								"Onedark
Plug 'arcticicestudio/nord-vim'							"Nord
Plug 'ghifarit53/tokyonight-vim'						"Tokyonight
Plug 'kaicataldo/material.vim', { 'branch' : 'main' }	"Material
Plug 'altercation/vim-colors-solarized'					"Solarized

"Airline
Plug 'vim-airline/vim-airline'							"Airline
Plug 'vim-airline/vim-airline-themes'					"Airline themes

"Useful plugins
Plug 'preservim/nerdtree'								"Nerdtree
Plug 'vim-utils/vim-man'								"Vim man
"Plug 'norcalli/nvim-colorizer.lua'						"Colorizer for hex color values
Plug 'lyuts/vim-rtags'

"Autocompletion engine
Plug 'neoclide/coc.nvim', {'branch' : 'release'}		"Coc autocomplete

call plug#end()
