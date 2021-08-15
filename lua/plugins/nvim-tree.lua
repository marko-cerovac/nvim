vim.g.nvim_tree_width = 34
-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }

vim.g.nvim_tree_show_icons = {
    git = 0,
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
		error = " ",
		warning = " ",
		hint = " ",
		info = " "
    }
}

    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "v",                            cb = tree_cb("vsplit") },
        { key = "s",                            cb = tree_cb("split") },
        { key = "t",                            cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = "<BS>",                         cb = tree_cb("close_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "x",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("full_rename") },
        { key = "d",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "[c",                           cb = tree_cb("prev_git_item") },
        { key = "]c",                           cb = tree_cb("next_git_item") },
        { key = "-",                            cb = tree_cb("dir_up") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "g?",                           cb = tree_cb("toggle_help") },
    }

-- Map key
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
