local dapui = require "dapui"

dapui.setup {
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = { "d", "x" },
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = true,
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40,
            position = "right",
        },
        {
            elements = {
                "console",
                "repl",
            },
            size = 0.25,
            position = "bottom",
        },
        {
            elements = {
                "console",
            },
            size = 0.40,
            position = "right",
        }
    },
    floating = {
        border = vim.g.border_style,
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
}
