local map  = vim.keymap.set
local opts = { silent = true }

-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'
map('n', '<Space>', '<NOP>', opts)

-- window navigation
map('n', '<M-j>', '<C-w>j', opts)
map('n', '<M-k>', '<C-w>k', opts)
map('n', '<M-h>', '<C-w>h', opts)
map('n', '<M-l>', '<C-w>l', opts)

-- window resizing
map('n', '<C-j>', ':resize -2<CR>', opts)
map('n', '<C-k>', ':resize +2<CR>', opts)
map('n', '<C-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-l>', ':vertical resize +2<CR>', opts)

-- window splitting
map('n', '<M-s>', '<C-w>s', opts)
map('n', '<M-v>', '<C-w>v', opts)

-- switching buffers
map('n', 'gb', ':bnext<CR>', opts)

-- indenting lines
map('v', '<', '<gv')
map('v', '>', '>gv')

-- escaping insert mode
map('i', 'jf', '<Esc>', opts)
map('i', 'fj', '<Esc>', opts)

-- center window when scrolling
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- removing search highlight
map('n', '<Leader>h', ':noh<CR>', opts)

-- opening terminal
map('n', '<Leader>t', ':terminal<CR>', opts)
map('n', '<Leader>v', '<C-w>v:terminal<CR>', opts)
map('n', '<Leader>s', '<C-w>s:terminal<CR>', opts)
map('t', '<Esc><Esc>', '<C-\\><C-n>', opts)

-- undo break-points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- align code
map('v', 'g=', '! column -t -s= -o=<CR>')
