require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = true,
    styles = {
        comments = { "italic" },
        functions = { "italic" },
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        neogit = true,
        dap = true,
        native_lsp = {
            enabled = true
        },
        indent_blankline = {
            enabled = true,
        }
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
