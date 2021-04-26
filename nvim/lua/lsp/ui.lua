--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: lsp/ui.lua
--       \/__/         \/__/       Desc: lsp ui settings


local saga = require('lspsaga')

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '﯇',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    max_preview_lines = 10,
    code_action_prompt = {
         enable = true,
         sign = true,
         sign_priority = 20,
         virtual_text = true,
    },
    finder_definition_icon = '  ',
    definition_preview_icon = '  ',
    border_style = "single",
    rename_prompt_prefix = '➤',
}

-- Floating terminal
vim.api.nvim_set_keymap('n', '<Leader>tf', [[:lua require('lspsaga.floaterm').open_float_terminal()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Leader>tq', [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]], { noremap = true, silent = true })
