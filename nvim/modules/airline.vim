"   [ Marko Cerovac | Vim/NeoVim | airline settings ]
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

"Enable tabline
let g:airline#extensions#tabline#enabled = 1

"Format tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1

"Powerline fonts
let g:airline_powerline_fonts = 1

"Show tabline only for multiple tabs
"set showtabline=1
