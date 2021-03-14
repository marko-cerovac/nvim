"   [ Marko Cerovac | Vim/NeoVim | startify settings ]
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

"Set custom header
let g:startify_custom_header = [
          \'         .|.            |.                                     ',
          \'       .cc|:;           |::.                                   ',
          \'     .cccc|:::;         |::::.                                 ',
          \'    |ccccc|::::;        |:::::|                                ',
          \'    |ccccc|::::::;      |:::::|        ___           ___       ',
          \'    |ccccc|:::::::;     |:::::|       /\  \         /\__\      ',
          \'    |ccccc| ;:::::::;   |:::::|      |::\  \       /:/  /      ',
          \'    |ccccc|  ;:::::::;  |:::::|      |:|:\  \     /:/  /       ',
          \'    |ccccc|   ;:::::::; |:::::|    __|:|\:\  \   /:/  /  ___   ',
          \'    |ccccc|     ;:::::::|:::::|   /::::|_\:\__\ /:/__/  /\__\  ',
          \'    |ccccc|      ;::::::|:::::|   \:\~~\  \/__/ \:\  \ /:/  /  ',
          \'    |ccccc|        ;::::|:::::|    \:\  \        \:\  /:/  /   ',
          \'     .cccc|         ;:::|::::.      \:\  \        \:\/:/  /    ',
          \'       .cc|           ;;|::.         \:\__\        \::/  /     ',
          \'         .|            .|.            \/__/         \/__/      ',
		  \]

"Set the sessions directory
let g:startify_session_dir = '~/Templates/NeoVim'

"Set menu order
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

"Set bookmaarks
let g:startify_bookmarks = [
		  \ { 'i': '~/.config/nvim/init.vim' },
		  \ { 'b': '~/.bashrc' },
		  \ { 'c': '~/.config/qtile/config.py' },
		  \ { 'a': '~/.config/alacritty/alacritty.yml' },
		  \ ]

"Let startify delete buffers
let g:startify_session_delete_buffers = 1

"Automatically update sessions
let g:startify_session_persistance = 1

"Delete empty buffer and quit
let g:startify_enable_special = 0

"Material ocean theme for startify
highlight StartifyHeader guifg=#546e7a
highlight StartifyPath guifg=#89ddff
highlight StartifyFile guifg=#c792ea
highlight StartifyNumber guifg=#c3e88d
highlight StartifySection guifg=#ffffff
highlight StartifySlash guifg=Gray
highlight StartifyBracket guifg=Gray
