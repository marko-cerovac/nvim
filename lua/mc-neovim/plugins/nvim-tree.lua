local tree_cb = require"nvim-tree.config".nvim_tree_callback

-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" } --empty by default
-- vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_git_hl = 0 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_icon_padding = " " --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = " >> " -- defaults to " ➛ ". used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 1 --0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
-- vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
     git = 1,
     folders = 1,
     files = 1,
     folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★',
        deleted = '',
        ignored = '◌'
    },
    folder = {
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = '',
    },
    lsp = {
		error = ' ',
		warning = ' ',
		hint = ' ',
		info = ' '
    }
}

-- following options are the default
require"nvim-tree".setup {
	hijack_cursor       = true,
	update_cwd          = true,
	diagnostics = { enable = true, },

	view = {
		width = 40,
		hide_root_folder = true,
		mappings = {
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
			}
		}
	}
}

-- Map key
vim.api.nvim_set_keymap('n', "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
