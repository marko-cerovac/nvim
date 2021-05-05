--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: mappings.lua
--       \/__/         \/__/       Desc: global mappings


-- Map leader to Space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Window navigation
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wr', '<C-w><C-r>', { noremap = true, silent = true })

-- Window resizing
vim.api.nvim_set_keymap('n', '<C-j>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Window splitting
vim.api.nvim_set_keymap('n', '<leader>ws', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wv', ':vertical split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wt', ':tab split<CR>', { noremap = true, silent = true })

-- Indent selected lines
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Escape insert mode
vim.api.nvim_set_keymap('i', 'jf', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Remove search highlight
vim.api.nvim_set_keymap('n', '<Leader>sh', [[<cmd>noh<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', [[<cmd>noh<CR>]], { noremap = true, silent = true })

-- Open terminal
vim.api.nvim_set_keymap('n', '<Leader>v', ':vertical new<CR>:terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vertical new<CR>:terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ts', ':split new<CR>:terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tt', ':tab new<CR>:terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Compile code
vim.api.nvim_set_keymap('n', '<Leader>cc', ':make<CR>', { noremap = true, silent = true })

-- Toggle settings
vim.api.nvim_set_keymap('n', '<Leader>sn', [[<Cmd>lua require("general/functions").number()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sr', [[<Cmd>lua require("general/functions").relative_number()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sc', [[<cmd>lua require("general/functions").cursor_line()<CR>]], { noremap = true, silent = true })

