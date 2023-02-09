local material = require "material"

local map  = vim.keymap.set
local opts = { silent = true }

vim.g.material_style = "deep ocean"

material.setup {
    contrast = {
        cursor_line = true,
    },
    disable = {
        eob_lines = true,
        -- borders = true,
    },
    styles = {
        comments = { italic = true },
        functions = { italic = true },
    },
    plugins = {
        "indent-blankline",
        "telescope",
        "nvim-cmp",
        "nvim-web-devicons",
        "gitsigns",
        "neogit",
        "neorg",
        "dap",
    },
    lualine_style = "stealth",
}

-- toggle light/dark background
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

-- enable the colorscheme
vim.cmd "colorscheme material"
