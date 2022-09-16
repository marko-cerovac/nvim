local ts = require "nvim-treesitter.configs"

ts.setup {
    ensure_installed = { "c", "cpp", "make", "lua", "rust", "bash", "java" },
    highlight = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ab"] = "@block.outer",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ai"] = "@conditional.outer",
                ["al"] = "@loop.outer",
                ["ac"] = "@class.outer",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]b"] = "@block.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]B"] = "@block.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[b"] = "@block.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[B"] = "@block.outer",
            },
        },
    },
}

vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
