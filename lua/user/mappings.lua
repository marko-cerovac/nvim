vim.keymap.set('n', '<Space>', '<Nop>')

vim.keymap.set({ 'n', 't' }, '<M-w>', '<C-w>')
vim.keymap.set({ 'n', 't' }, '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set({ 'n', 't' }, '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<M-J>', ':resize -2<CR>', { desc = 'Resize window down' })
vim.keymap.set('n', '<M-K>', ':resize +2<CR>', { desc = 'Resize window up' })
vim.keymap.set('n', '<M-H>', ':vertical resize -2<CR>', { desc = 'Resize window to the left' })
vim.keymap.set('n', '<M-L>', ':vertical resize +2<CR>', { desc = 'Resize window to the right' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search results highlight' })
vim.keymap.set('i', 'jf', '<Esc>', { desc = 'Escape insert mode' })
vim.keymap.set('i', 'fj', '<Esc>', { desc = 'Escape insert mode' })

vim.keymap.set('n', '<M-s>', '<cmd>split<CR><cmd>terminal<CR>', {
    desc = 'Toggle the terminal in a split'
})
vim.keymap.set('n', '<M-v>', '<cmd>vertical split<CR><cmd>terminal<CR>', {
    desc = 'Toggle the terminal a vertical split'
})

-- hold on to selection when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- center the window when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- better terminal navigation
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<M-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<M-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<M-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<M-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus to the right window' })

-- change directory to that of currnet buffer
vim.keymap.set('n', '<leader>cd', ':lcd %:h<CR>', { desc = 'Change directory to that of current buffer' })

-- undo breakpoints
vim.keymap.set('i', ',', ',<C-g>u')
vim.keymap.set('i', '.', '.<C-g>u')
vim.keymap.set('i', ';', ';<C-g>u')

-- align code
vim.keymap.set('v', 'g=', '! column -t -s= -o=<CR>', { desc = 'Align code to the \'=\' char' })
