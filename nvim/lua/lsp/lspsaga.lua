--  [ Marko Cerovac | NeoVim | LSP saga settings ]
--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--

local saga = require('lspsaga')

saga.init_lsp_saga {
-- default value
 use_saga_diagnostic_sign = true,
 error_sign = '﯇',
 warn_sign = '',
 hint_sign = '',
 infor_sign = '',
 dianostic_header_icon = '   ',
 code_action_icon = ' ',
 code_action_prompt = {
   enable = true,
   sign = true,
   sign_priority = 20,
   virtual_text = true,
 },
 finder_definition_icon = '  ',
 definition_preview_icon = '  ',
 border_style = 1,
 rename_prompt_prefix = '➤',
 }

-- Key mappings

-- Hover
vim.api.nvim_set_keymap('n', 'K', [[:lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-f>', [[:lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-b>', [[:lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })

-- Lsp finder
vim.api.nvim_set_keymap('n', 'gh', [[:lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap = true, silent = true })

-- Preview definition
vim.api.nvim_set_keymap('n', '<Leader>cp', [[:lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })


-- Code action
vim.api.nvim_set_keymap('n', '<leader>ca', [[:<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ca', [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], { noremap = true, silent = true })

-- Signature help
vim.api.nvim_set_keymap('n', 'gs', [[:lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })

-- Rename
vim.api.nvim_set_keymap('n', '<Leader>cr', [[:lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })

-- Diagnostics
vim.api.nvim_set_keymap('n', '<Leader>cd', [[:lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', [[:lua require'lspsaga.diagnostic'.lsp_jump_diagnistic_prev()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', [[:lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })

-- Floating terminal
vim.api.nvim_set_keymap('n', '<Leader>tf', [[:lua require('lspsaga.floaterm').open_float_terminal()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Leader>tq', [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]], { noremap = true, silent = true })
