require('neogit').setup{}

-- Open neogit
vim.api.nvim_set_keymap('n', '<leader>gg', [[<cmd>lua require('neogit').open()<CR>]], { noremap = true, silent = true })

