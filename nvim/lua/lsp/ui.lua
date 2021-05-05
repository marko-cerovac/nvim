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
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = ' ',
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
    rename_prompt_prefix = '➤ ',
}

require('trouble').setup {
    height = 10, -- height of the trouble list
    icons = true, -- use dev-icons for filenames
    mode = "workspace", -- "workspace" or "document"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        toggle_mode = "m", -- toggle between "workspace" and "document" mode
        toggle_preview = "P", -- toggle auto_preview
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

-- Floating terminal
vim.api.nvim_set_keymap('n', '<Leader>tf', [[:lua require('lspsaga.floaterm').open_float_terminal()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Leader>tq', [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]], { noremap = true, silent = true })
