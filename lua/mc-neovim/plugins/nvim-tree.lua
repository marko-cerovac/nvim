local tree_cb = require"nvim-tree.config".nvim_tree_callback

require'nvim-tree'.setup {
  hijack_cursor = true,
  update_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  view = {
    adaptive_size = true,
    width = 30,
    -- height = 30,
    hide_root_folder = true,
    side = "left",
    -- preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {
		{ key = {"<2-RightMouse>", "<gh>"},     cb = tree_cb("cd") },
		{ key = 'v',							cb = tree_cb("vsplit") },
		{ key = 's',                          	cb = tree_cb("split") },
		{ key = 't',                          	cb = tree_cb("tabnew") },
		{ key = 'x',                            cb = tree_cb("remove") },
		{ key = 'X',                            cb = tree_cb("trash") },
		{ key = 'd',							cb = tree_cb("cut") },
		{ key = 'y',                            cb = tree_cb("copy") },
		{ key = 'p',                            cb = tree_cb("paste") },
		{ key = 'N',                            cb = tree_cb("copy_name") },
		{ key = 'Y',                            cb = tree_cb("copy_path") },
		{ key = 'gy',                           cb = tree_cb("copy_absolute_path") },
		{ key = '[g',                           cb = tree_cb("prev_git_item") },
		{ key = ']g',                           cb = tree_cb("next_git_item") },
		{ key = '-',                            cb = tree_cb("dir_up") },
		{ key = '.',                            cb = tree_cb("dir_up") },
		{ key = 'S',                            cb = tree_cb("system_open") },
		{ key = 'q',                            cb = tree_cb("close") },
		{ key = '?',                           cb = tree_cb("toggle_help") },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      --[[ hint = "",
      info = "",
      warning = "",
      error = "", ]]
      error = ' ',
      warning = ' ',
      hint = ' ',
      info = ' '
    },
  },
}

-- Map key
vim.api.nvim_set_keymap('n', "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
