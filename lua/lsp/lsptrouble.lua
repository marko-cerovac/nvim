require('trouble').setup {}

vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>TroubleToggle<CR>', { noremap = true, silent = true })
