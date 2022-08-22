local map = vim.keymap.set
local opts = { silent = true }

-- Map leader to ;
-- map("n", "<Space>", ";", opts)
-- map('n', ";", "<NOP>", opts)
-- vim.g.mapleader = ';'

-- Map leader to space
map("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = ' '

-- Window navigation
map('n', "<M-j>", "<C-w>j", opts)
map('n', "<M-k>", "<C-w>k", opts)
map('n', "<M-h>", "<C-w>h", opts)
map('n', "<M-l>", "<C-w>l", opts)

-- Window resizing
map('n', "<C-j>", ":resize -2<CR>", opts)
map('n', "<C-k>", ":resize +2<CR>", opts)
map('n', "<C-h>", ":vertical resize -2<CR>", opts)
map('n', "<C-l>", ":vertical resize +2<CR>", opts)

-- Window splitting
map('n', "<Leader>ws", ":split<CR>", opts)
map('n', "<Leader>wv", ":vertical split<CR>", opts)
map('n', "<Leader>wt", ":tab split<CR>", opts)

-- Window moving
map('n', "<Leader>wh", "<C-w>H", opts)
map('n', "<Leader>wj", "<C-w>J", opts)
map('n', "<Leader>wk", "<C-w>K", opts)
map('n', "<Leader>wl", "<C-w>L", opts)

-- Switching buffers
map('n', "<Tab>", ":bnext<CR>", opts)
map('n', "<S-Tab>", ":bprevious<CR>", opts)

-- Indenting lines
map('v', '<', "<gv", opts)
map('v', '>', ">gv", opts)

-- Escaping insert mode
map('i', "jf", "<Esc>", opts)
map('i', "fj", "<Esc>", opts)

-- Removing search highlight
map('n', "<leader>h", ":noh<CR>", opts)
map('n', "<M-;>", ":noh<CR>", opts)

-- Opening terminal
map('n', "<Leader>v", ":vertical new<CR>:terminal<CR>", opts)
map('n', "<Leader>ts", ":split new<CR>:terminal<CR>", opts)
map('n', "<Leader>tt", ":tab new<CR>:terminal<CR>", opts)
map('t', "<Esc>", "<C-\\><C-n>", opts)

-- External command
map('n', "<Leader><Tab>", ":!")

-- Toggle indent lines
map('n', "<Leader>si", "<cmd>IndentBlanklineToggle<CR>", opts)
