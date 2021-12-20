vim.g.indent_blankline_enabled = true
vim.g.indent_blankline_buftype_exclude = { 'terminal' }
vim.g.indent_blankline_filetype_exclude = {'dashboard',	'packer'}

-- vim.g.indent_blankline_char = ''
vim.g.indent_blankline_char = '│'

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = false

-- Toggle indent line
vim.api.nvim_set_keymap('n', '<leader>si', '<Cmd>IndentBlanklineToggle<CR>', { noremap = true, silent = true })
