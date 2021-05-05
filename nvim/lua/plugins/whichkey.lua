--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/whichkey.lua
--       \/__/         \/__/       Desc: which-key settings


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
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 3, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 5, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- Key mappings

-- Standalone mappings
wk.register({
    ["<leader>e"] = "explore",
    ["<leader>v"] = "vert-split terminal",
    ["<leader>h"] = "remove highlight",
})

-- Git
wk.register({
    g = {
        name = "git",
        f = "git files",
        c = "git commits",
        b = "git branches",
        l = "git line blame",
        s = "git status"
    },
}, { prefix = "<leader>" })

-- Code
wk.register({
    c = {
        name = "code",
        a = "actions",
        c = "compile",
		d = "diagnostics",
        l = "line diagnostics",
        p = "preview definition",
        r = "rename",
        t = "type definition",
        q = "set location list"
    }
}, { prefix = "<leader>" })
wk.register({
    c = {
        name = "code",
        a = "range actions"
    }
}, { mode = "v", prefix = "<leader>" })

-- kommentary
wk.register({
    k = {
        name = "kommentary",
        l = "comment line",
        i = "comment increase",
        d = "comment decrease",
    }
}, { prefix = "<leader>"})
wk.register({
    k = {
        name = "kommentary",
        i = "range comment increase",
        d = "range comment decrease",
    }
}, { mode = "v", prefix = "<leader>"})

-- Terminal
wk.register({
    t = {
        name = "terminal",
        v = "vertical split",
        s = "horizontal split",
        t = "new tab",
        f = "floating",
        q = "quit floating"
    }
}, { prefix = "<leader>" })

-- Settings
wk.register({
    s = {
        name = "settings",
        n = "set numbers",
        r = "set relative numbers",
        c = "set cursorline",
        i = "set indentline",
        h = "set highlights",
        m = "toggle material style"
    }
}, { prefix = "<leader>" })

-- Find
wk.register({
    f = {
        name = "find",
        a = "code actions",
        b = "buffers",
		c = "in current buffer",
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
wk.register({
    d = {
        name = "directory",
        a = "add directory",
        l = "list directories",
        r = "remove directory",
    }
}, { prefix = "<leader>" })

-- Window
wk.register({
    w = {
        name = "window",
        v = "vertical split",
        s = "horizontal split",
        t = "tab split",
        r = "rotate",
        l = "load session",
        a = "archive session"
    }
}, { prefix = "<leader>" })

-- Go to commands
wk.register({
    ["gb"] = "next buffer",
    ["gB"] = "previous buffer",
    ["gd"] = "definition",
    ["gD"] = "declaration",
    ["gr"] = "references",
    ["gs"] = "signature",
    ["gt"] = "next tab",
    ["gT"] = "previous tab",
    ["gh"] = "lsp finder",
})

-- Visual mode
wk.register({
    k = {
        name = "kommentary",
    }
}, { mode = "v", prefix = "<leader>" })

-- Ignore
wk.register({
    ["<leader>cic"] = "which_key_ignore",
    ["<leader>ci"] = "which_key_ignore",
    ["<leader>1"] = "which_key_ignore",
    ["<leader>2"] = "which_key_ignore",
    ["<leader>3"] = "which_key_ignore",
    ["<leader>4"] = "which_key_ignore",
    ["<leader>5"] = "which_key_ignore",
    ["<leader>6"] = "which_key_ignore",
    ["<leader>7"] = "which_key_ignore",
    ["<leader>8"] = "which_key_ignore",
    ["<leader>9"] = "which_key_ignore",
})
wk.register({
    ["<leader>cd"] = "which_key_ignore",
    ["<leader>ci"] = "which_key_ignore",
}, { mode = 'v' })
