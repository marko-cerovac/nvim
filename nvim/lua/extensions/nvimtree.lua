--  [ Marko Cerovac | NeoVim | nvim tree settings ]
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

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_width = 35                                      --30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }   --empty by default
vim.g.nvim_tree_auto_open = 1                                   --0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1                                  --0 by default, closes the tree when it's the last window
vim.g.nvim_tree_quit_on_open = 1                                --0 by default, closes the tree when you open a file
--vim.g.nvim_tree_follow = 1                                      --0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1                              --0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 1                               --0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1                                      --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_width_allow_resize  = 1                         --0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_tab_open = 1                                    --0 by default, will open the tree when entering a new tab and the tree was previously open
--vim.g.nvim_tree_side = 'left'                                 --[ 'right' | 'left' ] "left by default
--vim.g.nvim_tree_root_folder_modifier = ':~'                   --this is the default. See :help filename-modifiers for more options
--vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}    --empty by default, don't auto open tree on specific filetypes.
--vim.g.nvim_tree_disable_netrw = 0                             --1 by default, disables netrw
--vim.g.nvim_tree_hijack_netrw = 0                              --1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
--vim.g.nvim_tree_add_trailing = 1                              --0 by default, append a trailing slash to folder names
vim.g.nvim_tree_show_icons = {
     git = 1,
     folders = 1,
     files =  1,
     }

vim.g.nvim_tree_icons = {
     default =  '',
     symlink = '',
     git =  {
       unstaged =  "✗",
       staged = "✓",
       unmerged = "",
       renamed = "➜",
       untracked = "★"
       },
     folder = {
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       symlink_open = "",
       }
     }

vim.g.nvim_tree_bindings = {
  --["<CR>"] = ":YourVimFunction()<cr>",
  --["u"] = ":lua require'some_module'.some_function()<cr>",

  -- Nvim tree key mappings
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["<C-]>"]          = tree_cb("cd"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["t"]              = tree_cb("tabnew"),
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
  [".."]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
