"   [ Marko Cerovac | Vim/NeoVim | tokyonight theme settings ]
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

let g:tokyonight_style = 'storm'						"[ night | storm ]
let g:tokyonight_enable_italic = 1						"Enable italic support
let g:tokyonight_disable_italic_comment = 0				"Disable italic comments
let g:tokyonight_transparent_background = 0				"Enable transparent background
let g:tokyonight_menu_selection_background = 'blue'		"[ green | red | blue ] background for PmenuSel and WildMenu
let g:tokyonight_cursor = 'auto'						"[ auto | green | red | blue ] cursor color
let g:tokyonight_current_word = 'underline'				"[ bold | underline | italic | grey background ] word highlighting for coc

let g:airline_theme_style = 'tokyonight'				"Enable tokyonight theme for airline

colorscheme tokyonight
