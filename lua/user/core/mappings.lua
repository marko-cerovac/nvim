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
map('n', '<M-w>', '<C-w>', opts)
-- map('n', '<M-j>', function()
--     vim.cmd.wincmd('j')
-- end, opts)
-- map('n', '<M-k>', function()
--     vim.cmd.wincmd('k')
-- end, opts)
-- map('n', '<M-h>', function()
--     vim.cmd.wincmd('h')
-- end, opts)
-- map('n', '<M-l>', function()
--     vim.cmd.wincmd('l')
-- end, opts)

-- window resizing
map('n', '<M-J>', ':resize -2<CR>', opts)
map('n', '<M-K>', ':resize +2<CR>', opts)
map('n', '<M-H>', ':vertical resize -2<CR>', opts)
map('n', '<M-L>', ':vertical resize +2<CR>', opts)

-- switching buffers
map('n', 'gb', ':bnext<CR>', opts)

-- removing search highlight
map('n', 'gh', ':noh<CR>', opts)

-- hold on to selection when indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- escaping insert mode
map('i', 'jf', '<Esc>', opts)
map('i', 'fj', '<Esc>', opts)

-- center window when scrolling
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- check if nu exists and use it as a shell
local shell_cmd = vim.fn.executable('nu') == 1 and 'nu' or ''

map('n', '<Leader>tt', function()
    vim.cmd.term(shell_cmd)
end, opts)
map('n', '<Leader>tv', function()
    vim.cmd.vnew()
    vim.cmd.term(shell_cmd)
end, opts)
map('n', '<Leader>ts', function()
    vim.cmd.split()
    vim.cmd.term(shell_cmd)
end, opts)

-- terminal navigation
map('t', '<Esc><Esc>', '<C-\\><C-n>', opts)
map('t', '<M-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<M-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<M-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<M-l>', '<C-\\><C-n><C-w>l', opts)

-- undo break-points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- align code
map('v', 'g=', '! column -t -s= -o=<CR>')
