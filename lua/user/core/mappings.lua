local map = vim.keymap.set


-- map leader to space
vim.g.mapleader      = ' '
vim.g.maplocalleader = ','
map('n', '<Space>', '<NOP>')

map('n', '<M-j>', '<C-w>j', { desc = 'Move focus to lower window' })
map('n', '<M-k>', '<C-w>k', { desc = 'Move focus to upper window' })
map('n', '<M-h>', '<C-w>h', { desc = 'Move focus to left window' })
map('n', '<M-l>', '<C-w>l', { desc = 'Move focus to right window' })
map('n', '<M-w>', '<C-w>')

map('n', '<M-J>', ':resize -2<CR>', { desc = 'Resize window down' })
map('n', '<M-K>', ':resize +2<CR>', { desc = 'Resize window up' })
map('n', '<M-H>', ':vertical resize -2<CR>', { desc = 'Resize window to the left' })
map('n', '<M-L>', ':vertical resize +2<CR>', { desc = 'Resize window to the right' })

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

-- check if nu exists and use it as a shell
local shell_cmd = vim.fn.executable('nu') == 1 and 'nu' or ''

map('n', '<Leader>tv', function()
    vim.cmd.vsp()
    vim.cmd.term(shell_cmd)
end, { desc = 'Open terminal vertically' })
map('n', '<Leader>ts', function()
    vim.cmd.sp()
    vim.cmd.term(shell_cmd)
end, { desc = 'Open terminal horizontally' })
map({ 'n', 't' }, '<M-t>', function()
    require('user.util.floating_terminal').toggle(shell_cmd)
end, { desc = 'Toggle floating terminal' })

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
