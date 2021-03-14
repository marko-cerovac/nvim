"   [ Marko Cerovac | Vim/NeoVim | quickscope settings ]
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

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']											"Enable highlights only on certain keys

"Highliht clors
highlight QuickScopePrimary guifg='#89ddff' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#c3e88d' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150																		"Characters limit
