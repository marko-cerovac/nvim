"Map leader to which key
nnoremap <silent> <leader> :WhichKey '<space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

"Disable floating window
let g:which_key_use_floating_win = 0

"Pop-up speed
set timeoutlen=100

"Set which key colors
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Type
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Operator

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

"Declare key map
let g:which_key_map = {}

let g:which_key_map['e'] = [ ':NERDTreeToggle'                  , 'explore' ]
let g:which_key_map['r'] = [ ':Ranger'                          , 'ranger' ]
let g:which_key_map['t'] = [ ':tabnew:terminal'                 , 'new tab terminal' ]
let g:which_key_map['v'] = [ ':vertical new:terminal'           , 'vertical split terminal' ]
let g:which_key_map['b'] = [ ':split new:terminal'              , 'below split terminal' ]
let g:which_key_map['rr'] = [ 'RangerCurrentDirectoryNewTab'    , 'ranger in new tab' ]
let g:which_key_map['rn'] = [ ':<Plug>(coc-rename)'             , 'Coc Rename' ]

"Register which key map
call which_key#register('<Space>', "g:which_key_map")
