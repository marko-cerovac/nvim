--  [ Marko Cerovac | NeoVim | material theme settings ]
--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--

-- Set theme style  [ default | oceanic | deep ocean | palenight | lighter | darker ]
vim.g.material_style = 'deep ocean'

-- enable italic comments
vim.g.material_italic_comments = 0

-- enable italic keywords
vim.g.material_italic_keywords = 1

-- enable italic function names
vim.g.material_italic_functions = 1

-- Key mapping for toggling the style
--vim.g.style_switch = 0
vim.api.nvim_set_keymap('n', '<Leader>0', [[<Cmd>lua require('material').toggle_style()<CR>]], {noremap = true})

-- Enable theme
require('colorbuddy').colorscheme('material')
