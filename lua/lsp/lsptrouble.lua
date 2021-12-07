require('trouble').setup {}

vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>LspTroubleToggle<CR>', { noremap = true, silent = true })
