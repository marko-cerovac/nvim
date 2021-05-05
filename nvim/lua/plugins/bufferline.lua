--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/bufferline.lua
--       \/__/         \/__/       Desc: bufferline settings


require'bufferline'.setup{
  options = {
    view = "default", -- | "multiwindow"
    numbers = "buffer_id",
    number_style = "", -- | "superscript",-- buffer_id at index 1, ordinal at index 2
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 20,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons =  false,
    show_close_icon =  false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    sort_by = 'extension'
  }
}

vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCycleNext<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'b]', '<cmd>BufferLineCyclePrev<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gb', '<cmd>BufferLineCycleNext<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gB', '<cmd>BufferLineCyclePrev<CR>', { silent = true, noremap = true })
