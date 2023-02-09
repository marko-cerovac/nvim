-- bootstrap lazy.nvim
require "user.util.lazy_init"

require ("lazy").setup({

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        build = ":TSUpdate",
        config = function()
            require "user.plugins.treesitter"
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = {
                    "kyazdani42/nvim-web-devicons",
                }

            },
            {
                "nvim-telescope/telescope-fzy-native.nvim",
                build = "make",
            },
        },
        config = function()
            require "user.plugins.telescope"
        end
    },

    -- language server installer
    {
        {
            "williamboman/mason.nvim",
            opts = {
                ui = { border = vim.g.border_style }
            }
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
            },
            config = true,
        }
    },

    -- language server protocol
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            -- require "user.lsp.config"
            require "user.lsp.servers"
        end,
    },

    -- completion engine
    {
        "hrsh7th/nvim-cmp",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require "user.lsp.snippets"
                end,
            },
        },
        config = function()
            require "user.lsp.completion"
        end,
    },

    -- commneting plugin
    {
        "b3nj5m1n/kommentary",
        keys = {
            {
                "<leader>k",
                desc = "comment line"
            },
            {
                "<leader>/",
                desc = "comment motion"
            },
        },
        config = function()
            local map = vim.keymap.set

            -- require("kommentary.config").configure_language("default", {
            --     prefer_single_line_comments = true,
            -- })

            map("n", "<leader>k", "<Plug>kommentary_line_default", {})
            map("x", "<leader>k", "<Plug>kommentary_visual_default", {})
            map("n", "<leader>/", "<Plug>kommentary_motion_default", {})
        end
    },


    -- debugg adapter protocol
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<Leader>dd", desc = "run code" },
            { "<Leader>b", desc = "toggle breakpoint" },
            { "<M-;>", desc = "toggle breakpoint" },
        },
        config = function()
            require "user.debugger.config"
        end,
    },

    -- debugg adapter ui
    {
        "rcarriga/nvim-dap-ui",
        keys = {
            { "<Leader>dd", desc = "run code" },
            { "<Leader>b", desc = "toggle breakpoint" },
            { "<M-;>", desc = "toggle breakpoint" },
        },
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require "user.debugger.ui"
        end,
    },

    -- colorscheme
    {
        "marko-cerovac/material.nvim",
        config = function()
            require "user.themes.material"
        end,
    },
    --[[ {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            require "user.themes.tokyonight"
        end,
    }, ]]

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require "user.plugins.lualine"
        end,
    },

    -- git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "user.plugins.gitsigns"
        end,
    },

    -- git ui
    {
        "TimUntersberger/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = "Neogit",
        config = function()
            require("neogit").setup {}
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup { check_ts = true }
            require("nvim-treesitter.configs").setup { autopairs = { enable = true } }
        end,
    },

    -- indent line
    {
        "lukas-reineke/indent-blankline.nvim",
        cmd = "IndentBlanklineToggle",
        config = function()
            require "user.plugins.indentline"
        end,
    },

    -- colorizer
    {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
    },
}, { ui = { border = vim.g.border_style }})
