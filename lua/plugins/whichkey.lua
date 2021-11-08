local wk = require('which-key')

wk.setup {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = " ", -- symbol used in the command line area that shows your active key combo
      group = " ", -- symbol prepended to a group
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 3, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 18, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
	ignore_missing = true
}

-- Key mappings


-- Standalone mappings
wk.register({
    ["<leader>e"] = "explore",
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
		l = "line diagnostics",
		p = "preview definition",
		r = "rename",
		s = "signature help",
		t = "type definition",
		q = "set location list"
	}
}, { prefix = "<leader>" })

-- Buffers
wk.register({
	b = {
		name = 'buffer',
		l = 'move buffer right',
		h = 'move buffer left',
		e = 'sort by extension',
		d = 'sort by directory',
		g = 'go to buffer',
		x = 'select to close',
	}
}, { prefix = '<leader>'})

-- Git
wk.register({
    g = {
        name = "git",
        b = "git branches",
        c = "git commits",
        f = "git files",
		i = "git status",
        l = "line blame",
		p = "preview hunk",
		r = "reset hunk",
		R = "reset buffer",
        s = "stage hunk",
		u = "unstage hunk"
    },
}, { prefix = "<leader>" })

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
		b = "set bufferline",
        r = "set relative numbers",
        c = "set cursorline",
        i = "set indentline",
		m = "set mouse",
        -- h = "set highlights",
        s = "toggle material style"
    }
}, { prefix = "<leader>" })

-- Find
wk.register({
    f = {
        name = "find",
        a = "code actions",
        b = "buffers",
		c = "in current buffer",
		e = "file browser",
        f = "files",
        g = "grep files",
        h = "help",
		o = "options",
        m = "manual pages",
        r = "recent files",
        s = "settings",
        t = "colorschemes"
    }
}, { prefix = "<leader>" })

-- Directory
--[[ wk.register({
    d = {
        name = "directory",
        a = "add directory",
        l = "list directories",
        r = "remove directory",
    }
}, { prefix = "<leader>" }) ]]

-- Window
wk.register({
    w = {
        name = "window",
		a = "add workspace folder",
        v = "vertical split",
        s = "horizontal split",
        t = "tab split",
        r = "rotate",
		h = "move left",
		j = "move down",
		k = "move up",
		x = "remove workspace folder",
		l = "move right",
        -- l = "load session",
        -- a = "archive session"
    }
}, { prefix = "<leader>" })

-- Go to commands
wk.register({
    --[[ ["gb"] = "next buffer",
    ["gB"] = "previous buffer",
    ["gd"] = "definition",
    ["gD"] = "declaration",
    ["gr"] = "references",
    ["gs"] = "signature",
    ["gt"] = "next tab",
    ["gT"] = "previous tab",
    ["gh"] = "lsp finder", ]]
})
