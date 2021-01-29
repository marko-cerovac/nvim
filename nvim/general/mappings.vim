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
"
"leader key
let g:mapleader = "\<Space>"            

"window navigation
nnoremap <C-h> <C-w>h                   
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"window resizing
nnoremap <m-j> :resize -2<CR>
nnoremap <m-k> :resize +2<CR>
nnoremap <m-h> :vertical resize -2<CR>
nnoremap <m-l> :vertical resize +2<CR>

"escape remaps
inoremap jf <Esc>
inoremap fj <Esc>

"save remaps
nnoremap <C-s> :w<CR>

"terminal remaps
nnoremap <leader>t :tabnew<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>

"Remove search highlight
nnoremap <leader>h :noh<CR>
