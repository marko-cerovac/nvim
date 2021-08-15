-- Enable italic comments
-- vim.g.material_italic_comments = true

-- Enable italic strings
-- vim.g.material_italic_strings = true

-- Enable italic keywords
vim.g.material_italic_keywords = true

-- Enable italic function names
vim.g.material_italic_functions = true

-- Enable italic variable names
-- vim.g.material_italic_variables = true

-- Enable terminal background
-- vim.g.material_disable_background = true

-- Enable borders
-- vim.g.material_borders = true

-- Enable high contrast
vim.g.material_contrast = true

-- Enable style toggling
vim.api.nvim_set_keymap('n', '<leader>sm', ':lua require("material.functions").toggle_style()<CR>', { noremap = true, silent = true })

-- Set the theme style
vim.g.material_style = 'deep ocean'

-- Enable the colorscheme
require('material').set()
