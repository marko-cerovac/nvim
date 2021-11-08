local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- following options are the default
require'nvim-tree'.setup {
	-- disables netrw completely
	disable_netrw       = true,
	-- hijack netrw window on startup
	hijack_netrw        = true,
	-- open the tree when running this setup function
	open_on_setup       = false,
	-- will not open on setup if the filetype is in this list
	ignore_ft_on_setup  = {},
	-- closes neovim automatically when the tree is the last **WINDOW** in the view
	auto_close          = true,
	-- opens the tree when changing/opening a new tab if the tree wasn't previously opened
	open_on_tab         = false,
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor       = true,
	-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
	update_cwd          = true,
	-- show lsp diagnostics in the signcolumn
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
	update_focused_file = {
		-- enables the feature
		enable      = false,
		-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
		-- only relevant when `update_focused_file.enable` is true
		update_cwd  = false,
		-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
		-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = {}
	},
	-- configuration options for the system open command (`s` in the tree by default)
	system_open = {
		-- the command to run this, leaving nil should work in most cases
		cmd  = nil,
		-- the command arguments as a list
		args = {}
	},

	view = {
		-- width of the window, can be either a number (columns) or a string in `%`
		width = 40,
		-- hide the roor floder name
		hide_root_folder = true,
		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = 'left',
		-- if true the tree will resize itself after opening a file
		auto_resize = true,
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = false,
			-- list of mappings to set on the tree manually
			list = {
				{ key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
				{ key = {"<2-RightMouse>", "<gh>"},     cb = tree_cb("cd") },
				{ key = "v",							  cb = tree_cb("vsplit") },
				{ key = "s",                        	  cb = tree_cb("split") },
				{ key = "t",                        	  cb = tree_cb("tabnew") },
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
				{ key = "r",                            cb = tree_cb("rename") },
				{ key = "<C-r>",                        cb = tree_cb("full_rename") },
				{ key = "d",							  cb = tree_cb("cut") },
				{ key = "y",                            cb = tree_cb("copy") },
				{ key = "p",                            cb = tree_cb("paste") },
				{ key = "N",                            cb = tree_cb("copy_name") },
				{ key = "Y",                            cb = tree_cb("copy_path") },
				{ key = "gy",                           cb = tree_cb("copy_absolute_path") },
				{ key = "[g",                           cb = tree_cb("prev_git_item") },
				{ key = "]g",                           cb = tree_cb("next_git_item") },
				{ key = "-",                            cb = tree_cb("dir_up") },
				{ key = ".",                            cb = tree_cb("dir_up") },
				{ key = "S",                            cb = tree_cb("system_open") },
				{ key = "q",                            cb = tree_cb("close") },
				{ key = "?",                           cb = tree_cb("toggle_help") },
			}
		}
	}
}

vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } --empty by default
vim.g.nvim_tree_gitignore = 1 --0 by default
vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_icon_padding = ' ' --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = ' >> ' -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 1 --0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
-- vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_window_picker_exclude = {
	filetype = {
		 'notify',
		 'packer',
		 'qf'
	},
	buftype = {
		 'terminal'
	}
}
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
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

-- Map key
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
