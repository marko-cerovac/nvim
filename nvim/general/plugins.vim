"    [ Marko Cerovac | Vim/NeoVim | Vim-Plug settings ]
"
"         ___           ___
"        /\  \         /\__\
"       |::\  \       /:/  /
"       |:|:\  \     /:/  /
"     __|:|\:\  \   /:/  /
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
Plug 'liuchengxu/space-vim-theme'								"Space vim
Plug 'joshdick/onedark.vim'										"Onedark
Plug 'arcticicestudio/nord-vim'									"Nord
Plug 'ghifarit53/tokyonight-vim'								"Tokyonight
Plug 'kaicataldo/material.vim', { 'branch' : 'main'	}	        "Material
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}	"Treesitter

"Autocompletion engine
Plug 'neoclide/coc.nvim', {'branch' : 'release'}				"Coc autocomplete

"Airline
Plug 'vim-airline/vim-airline'									"Airline
Plug 'vim-airline/vim-airline-themes'							"Airline themes

"NERDTree
Plug 'preservim/nerdtree'                                       "NERDTree file explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  "NERDTree highlighting

"Ranger
Plug 'francoiscabrol/ranger.vim'                                "Ranger
Plug 'rbgrouleff/bclose.vim'                                    "Ranger dependency

"Useful plugins
Plug 'mhinz/vim-startify'										"Startify start screen
Plug 'ryanoasis/vim-devicons'									"Icons
Plug 'unblevable/quick-scope'									"Quickscope
Plug 'honza/vim-snippets'										"Snippets
Plug 'norcalli/nvim-colorizer.lua'								"Colorizer

"Uninstaled plugins
"Plug 'lyuts/vim-rtags'                                         "Rtags for C++
"Plug 'sheerun/vim-polyglot'										"Polyglot syntax highlighting

call plug#end()
