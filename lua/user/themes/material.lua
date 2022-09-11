local material = require "material"

local map = vim.keymap.set
local opts = { silent = true }

-- Set the theme style
vim.g.material_style = "deep ocean"

material.setup {
    contrast = {
        cursor_line = true,
    },
    italics = {
        comments = true,
        functions = true,
    },
    disable = {
        -- borders = true,
        eob_lines = true,
    },
    plugins = {
        trouble = false,
        git_gutter = false,
        sidebar_nvim = false,
        lsp_saga = false,
        nvim_navic = false,
        sneak = false,
        hop = false,
        nvim_illuminate = false,
        mini = false,
    },
    lualine_style = "stealth",
}

-- Toggle light/dark background
map("n", "[t", function()
    if vim.g.material_style == "deep ocean" then
        vim.g.material_style = "lighter"
    else
        vim.g.material_style = "deep ocean"
    end
    vim.cmd "colorscheme material"
end, opts)

map("n", "]t", function()
    vim.ui.select({
        "oceanic",
        "deep ocean",
        "palenight",
        "lighter",
        "darker",
    }, { prompt = "Select Material style" }, function(choice)
        vim.g.material_style = choice
        vim.cmd "colorscheme material"
    end)
end, opts)

-- Enable the colorscheme
vim.cmd "colorscheme material"
