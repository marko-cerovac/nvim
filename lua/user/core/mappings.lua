local map  = vim.keymap.set

-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'
map('n', '<Space>', '<NOP>')

-- window navigation
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-h>', '<C-w>h')
map('n', '<M-l>', '<C-w>l')
map('n', '<M-w>', '<C-w>')
-- map('n', '<M-j>', function()
--     vim.cmd.wincmd('j')
-- end)
-- map('n', '<M-k>', function()
--     vim.cmd.wincmd('k')
-- end)
-- map('n', '<M-h>', function()
--     vim.cmd.wincmd('h')
-- end)
-- map('n', '<M-l>', function()
--     vim.cmd.wincmd('l')
-- end)

-- window resizing
map('n', '<M-J>', ':resize -2<CR>')
map('n', '<M-K>', ':resize +2<CR>')
map('n', '<M-H>', ':vertical resize -2<CR>')
map('n', '<M-L>', ':vertical resize +2<CR>')

-- switching buffers
map('n', 'gb', ':bnext<CR>')

-- removing search highlight
map('n', '<Esc>', ':noh<CR>')
-- map('n', 'gh', ':noh<CR>')

-- hold on to selection when indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- escaping insert mode
map('i', 'jf', '<Esc>')
map('i', 'fj', '<Esc>')

-- center window when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- check if nu exists and use it as a shell
local shell_cmd = vim.fn.executable('nu') == 1 and 'nu' or ''

map('n', '<Leader>tv', function()
    vim.cmd.vnew()
    vim.cmd.term(shell_cmd)
end)
map('n', '<Leader>ts', function()
    vim.cmd.split()
    vim.cmd.term(shell_cmd)
end)
map({'n', 't'}, '<M-t>', function()
    require('user.ui.floating_terminal').toggle(shell_cmd)
end)

-- terminal navigation
map('t', '<Esc><Esc>', '<C-\\><C-n>')
map('t', '<M-j>', '<C-\\><C-n><C-w>j')
map('t', '<M-k>', '<C-\\><C-n><C-w>k')
map('t', '<M-h>', '<C-\\><C-n><C-w>h')
map('t', '<M-l>', '<C-\\><C-n><C-w>l')

-- undo break-points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- align code
map('v', 'g=', '! column -t -s= -o=<CR>')
