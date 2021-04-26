--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/nvimtree.lua
--       \/__/         \/__/       Desc: nvim tree settings


vim.g.nvim_tree_width = 34
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {

    ["<CR>"]           = tree_cb("edit"),
    ["o"]              = tree_cb("edit"),
    ["<2-LeftMouse>"]  = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"]          = tree_cb("cd"),
    ["v"]            = tree_cb("vsplit"),
    ["s"]            = tree_cb("split"),
    ["t"]            = tree_cb("tabnew"),
    ["<"]              = tree_cb("prev_sibling"),
    [">"]              = tree_cb("next_sibling"),
    ["<BS>"]           = tree_cb("close_node"),
    ["<S-CR>"]         = tree_cb("close_node"),
    ["<Tab>"]          = tree_cb("preview"),
    ["I"]              = tree_cb("toggle_ignored"),
    ["H"]              = tree_cb("toggle_dotfiles"),
    ["R"]              = tree_cb("refresh"),
    ["a"]              = tree_cb("create"),
    ["d"]              = tree_cb("remove"),
    ["r"]              = tree_cb("rename"),
    ["<C-r>"]          = tree_cb("full_rename"),
    ["x"]              = tree_cb("cut"),
    ["c"]              = tree_cb("copy"),
    ["p"]              = tree_cb("paste"),
    ["[c"]             = tree_cb("prev_git_item"),
    ["]c"]             = tree_cb("next_git_item"),
    ["-"]              = tree_cb("dir_up"),
    ["q"]              = tree_cb("close"),

}

-- Map key
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
