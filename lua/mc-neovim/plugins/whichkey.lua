local wk = require("which-key")

wk.setup {
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = " ", -- symbol used in the command line area that shows your active key combo
		group = " ", -- symbol prepended to a group
	},
	window = {
		border = vim.g.border_style, -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 3, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 18, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true
}

-- Key mappings


-- Standalone mappings
wk.register({
	["<leader>e"] = "explore",
	-- ["<leader>b"] = "sidebar",
	["<leader>v"] = "vert-split terminal",
	["<leader>h"] = "remove highlight",
	["<leader>k"] = "comment line",
	["<leader>d"] = "debugg"
})

-- Go-to commands
wk.register({
	["gd"] = "go-to definition",
	["gD"] = "go-to declaration",
	["gi"] = "go-to implementation",
	["gr"] = "go-to references",
})

-- Ignore escape remaps
wk.register({
	["fj"] = "which_key_ignore",
	["jf"] = "which_key_ignore",
	["jj"] = "which_key_ignore",
}, {mode = 'i'})

-- Code
wk.register({
	c = {
		name = "code",
		a = "actions",
		c = "compile",
		d = "diagnostics",
		f = "format",
		g = "run code",
		h = "finder",
		l = "line diagnostics",
		L = "cursor diagnostics",
		o = "outline",
		p = "preview definition",
		r = "rename",
		s = "signature help",
		t = "type definition",
		-- q = "set location list"
	}
}, { prefix = "<leader>" })

wk.register({
	w = {
		name = "workspace",
		a = "add folder",
		x = "remove folder",
		l = "list folders",
	}
}, { prefix = "<leader>c" })

-- Buffers
-- wk.register({ b = { name = "buffer", } }, { prefix = "<leader>"})

-- Git
wk.register({ g = { name = "git", }, }, { prefix = "<leader>" })

-- Terminal
wk.register({
	t = {
		name = "terminal",
		v = "vertical split",
		s = "horizontal split",
		t = "new tab",
	}
}, { prefix = "<leader>" })

-- Settings
wk.register({
	s = {
		name = "settings",
		n = "set numbers",
		-- b = "set bufferline",
		r = "set relative numbers",
		c = "set cursorline",
		i = "set indentline",
		l = "set listchars",
		m = "set mouse",
		s = "toggle material style",
		z = "set colorizer",
	}
}, { prefix = "<leader>" })

-- Find
wk.register({ f = { name = "find", } }, { prefix = "<leader>" })

-- Window
wk.register({
	w = {
		name = "window",
		v = "vertical split",
		s = "horizontal split",
		t = "tab split",
		r = "rotate",
		h = "move left",
		j = "move down",
		k = "move up",
		l = "move right",
		-- l = "load session",
		-- a = "archive session"
	}
}, { prefix = "<leader>" })
