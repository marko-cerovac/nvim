local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map leader to Space
map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- Window navigation
map('n', '<M-j>', '<C-w>j', opts)
map('n', '<M-k>', '<C-w>k', opts)
map('n', '<M-h>', '<C-w>h', opts)
map('n', '<M-l>', '<C-w>l', opts)

-- Window resizing
map('n', '<C-j>', ':resize -2<CR>', opts)
map('n', '<C-k>', ':resize +2<CR>', opts)
map('n', '<C-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-l>', ':vertical resize +2<CR>', opts)

-- Window splitting
map('n', '<leader>ws', ':split<CR>', opts)
map('n', '<leader>wv', ':vertical split<CR>', opts)
map('n', '<leader>wt', ':tab split<CR>', opts)

-- Window rotating
map('n', '<leader>wr', '<C-w><C-r>', opts)

-- Window moving
map('n', '<leader>wh', '<C-w>H', opts)
map('n', '<leader>wj', '<C-w>J', opts)
map('n', '<leader>wk', '<C-w>K', opts)
map('n', '<leader>wl', '<C-w>L', opts)

-- Switching buffers
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)
-- map('n', 'gb', ':bnext<CR>', opts)
-- map('n', 'gB', ':bprevious<CR>', opts)

-- Indenting lines
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Escaping insert mode
map('i', 'jf', '<Esc>', opts)
map('i', 'fj', '<Esc>', opts)
map('i', 'kj', '<Esc>', opts)
-- map('i', 'jj', '<Esc>', opts)

-- Removing search highlight
map('n', '<leader>h', ':noh<CR>', opts)
map('n', '<M-;>', ':noh<CR>', opts)

-- Opening terminal
map('n', '<leader>v', ':vertical new<CR>:terminal<CR>', opts)
map('n', '<leader>tv', ':vertical new<CR>:terminal<CR>', opts)
map('n', '<leader>ts', ':split new<CR>:terminal<CR>', opts)
map('n', '<leader>tt', ':tab new<CR>:terminal<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- External command
map('n', '<leader><tab>', ':!', { noremap = true })

-- Compiling code
-- map('n', '<leader>cc', ':make<CR>', opts)
map('n', '<leader>cc', ':lua require("core.functions").build_system()<CR>', opts)

-- Running code
map('n', '<leader>cg', ':lua require("core.functions").run_code()<CR>', opts)

-- Toggling settings
map('n', '<leader>sn', [[:lua require('core.functions').number()<CR>]], opts)
map('n', '<leader>sr', [[:lua require('core.functions').relative_number()<CR>]], opts)
map('n', '<leader>sc', [[:lua require('core.functions').cursor_line()<CR>]], opts)
map('n', '<leader>sm', [[:lua require('core.functions').mouse()<CR>]], opts)

-- Toggle Nvim-Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- Disable kommentary mappings
vim.g.kommentary_create_default_mappings = false
