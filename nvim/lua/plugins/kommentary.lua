--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/kommentary.lua
--       \/__/         \/__/       Desc: kommentary settings


require('kommentary.config').use_extended_mappings()

-- Disable default key mappings
vim.g.kommentary_create_default_mappings = false

-- Disable multiline comments
require('kommentary.config').configure_language("default", {
    --prefer_single_line_comments = true,
    use_consistent_indentation = true
})

-- Key mappings
vim.api.nvim_set_keymap("n", "<leader>kl", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>k", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>k", "<Plug>kommentary_visual_default", {})

vim.api.nvim_set_keymap("n", "<leader>ki", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("v", "<leader>ki", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>kd", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("v", "<leader>kd", "<Plug>kommentary_visual_decrease", {})
