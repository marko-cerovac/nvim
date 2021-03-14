"   [ Marko Cerovac | Vim/NeoVim | remapps ]
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

"Key reamapping:

"leader key
let g:mapleader = "\<Space>"

"window navigation
nnoremap <m-j> <C-w>j
nnoremap <m-k> <C-w>k
nnoremap <m-h> <C-w>h
nnoremap <m-l> <C-w>l

"window resizing
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

"escape remap
inoremap jj <Esc>
inoremap jf <Esc>

"Quit reamp
nnoremap <C-q> :q<CR>

"save remap
nnoremap <C-s> :w<CR>

"terminal remaps
nnoremap <leader>t :tabnew<CR>:terminal<CR>
nnoremap <leader>v :vertical new<CR>:terminal<CR>
nnoremap <leader>b :split new<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>

"Remove search highlight
nnoremap <leader>nh :noh<CR>

"Open nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

"Remove trailing spaces
command Rmtrail %s/\s\+$//e

"Show open Buffers
nnoremap <leader>bb :ls<CR> 

"Hide tabline
nnoremap <leader>h :set showtabline=1<CR>
