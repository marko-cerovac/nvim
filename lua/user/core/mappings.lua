local map = vim.keymap.set


-- map leader to space
vim.g.mapleader      = ' '
vim.g.maplocalleader = ','
map('n', '<Space>', '<NOP>')

map({'n', 't'}, '<M-j>', '<C-w>j', { silent = true, desc = 'Move focus to lower window' })
map({'n', 't'}, '<M-k>', '<C-w>k', { silent = true, desc = 'Move focus to upper window' })
map({'n', 't'}, '<M-h>', '<C-w>h', { silent = true, desc = 'Move focus to left window' })
map({'n', 't'}, '<M-l>', '<C-w>l', { silent = true, desc = 'Move focus to right window' })
map({'n', 't'}, '<M-w>', '<C-w>')

map('n', '<M-J>', ':resize -2<CR>', { silent = true, desc = 'Resize window down' })
map('n', '<M-K>', ':resize +2<CR>', { silent = true, desc = 'Resize window up' })
map('n', '<M-H>', ':vertical resize -2<CR>', { silent = true, desc = 'Resize window to the left' })
map('n', '<M-L>', ':vertical resize +2<CR>', { silent = true, desc = 'Resize window to the right' })

map('n', 'gh', ':noh<CR>', { desc = 'Clear serarch highlighting', silent = true })
map('i', 'jf', '<Esc>', { desc = 'Escape insert mode' })
map('i', 'fj', '<Esc>', { desc = 'Escape insert mode' })
map('i', 'kj', '<Esc>', { desc = 'Escape insert mode' })

-- hold on to selection when indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- center window when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')


map({ 'n', 't' }, '<M-t>', function()
    require('user.util.terminal').toggle_current_buf()
end, { desc = 'Toggle floating terminal' })
map({ 'n', 't' }, '<M-f>', function()
    require('user.util.terminal').toggle_floating()
end, { desc = 'Toggle floating terminal' })
map({ 'n', 't' }, '<M-v>', function()
    require('user.util.terminal').toggle("v")
end, { desc = 'Toggle vertical split terminal '})
map({ 'n', 't' }, '<M-s>', function()
    require('user.util.terminal').toggle("h")
end, { desc = 'Toggle vertical split terminal '})

-- lua REPL
map('n', '<M-r>', function ()
    require('user.util.lua_repl').open({
        close_cmd = '<M-r>'
    })
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

map('v', 'g=', '! column -t -s= -o=<CR>', { desc = 'Align code to the \'=\' char' })

-- require('user.util.markdown_table_format')
