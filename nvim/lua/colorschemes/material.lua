--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: material.lua
--       \/__/         \/__/       Desc: material theme settings


-- Enable italic comments
vim.g.material_italic_comments = false

-- Enable italic keywords
vim.g.material_italic_keywords = true

-- Enable italic function names
vim.g.material_italic_functions = true

-- Enable italic variable names
vim.g.material_italic_variables = false

-- Enable terminal background
vim.g.material_disable_background = false

-- Enable borders
vim.g.material_borders = false

-- Enable high contrast
vim.g.material_contrast = true

-- Enable style toggling
vim.api.nvim_set_keymap('n', '<leader>sm', ':lua require("material.functions").toggle_style()<CR>', { noremap = true, silent = true })

-- Set the theme style
vim.g.material_style = 'deep ocean'

-- Enable the colorscheme
require('material').set()
