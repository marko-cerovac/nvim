"   [ Marko Cerovac | Vim/NeoVim | general settings ]
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

syntax on                               "Enables syntax highlighting

set hidden                              "Hidden buffers
set noswapfile							"Disable swap files
set noerrorbells                        "Disables sound
set smarttab                            "Sets smart tabs
set tabstop=4 softtabstop=4				"Changes tab spaces from 8 to 4
set shiftwidth=4						"Indents by 4 spaces
set expandtab
set smarttab                            "Makes tabbing smart
set smartindent                         "Sets smart indentnting
set autoindent                          "Automatic indenting
set number                              "Line number
set nowrap                              "No text wrapping
set cursorline                          "Highlihts current line
set incsearch                           "Incremental search results
set smartcase
set nobackup
set nowritebackup
set splitright                          "New vertical windows open on the right
set splitbelow                          "New horizontal windows open bellow
set clipboard=unnamedplus				"Clipboard for copy/paste
set termguicolors                       "Gvim colors
set background=dark						"Background theme [ light : dark ]
set guioptions-=r						"remove right-hand scroll bar
set encoding=UTF-8						"character encoding

filetype plugin indent on               "Vim can recognise filetypes

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

au! BufWritePost %MYVIMRC source%		"Automatic sorcing after changes to init.vim
