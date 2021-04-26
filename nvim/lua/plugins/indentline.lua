--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/indentline.lua
--       \/__/         \/__/       Desc: indent blankline settings


vim.g.indent_blankline_enabled = true
vim.g.indent_blankline_buftype_exclude = {'terminal'}

vim.g.indent_blankline_char = ''

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = false

-- Toggle indent line
vim.api.nvim_set_keymap('n', '<Leader>si', '<Cmd>IndentBlanklineToggle<CR>', { noremap = true, silent = true })
