require("indent_blankline").setup {
    -- char = "│",
    show_current_context = true,
    show_current_context_start = false,
    show_first_indent_level = true,
    use_treesitter = true,
    filetype_exclude = {
        "packer",
        "lspinfo",
        "checkhealth",
        "help",
    },
    buftype_exclude = {
        "terminal",
    },
}

vim.cmd "IndentBlanklineToggle"
