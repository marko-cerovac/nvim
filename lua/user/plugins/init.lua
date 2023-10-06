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
        event = {
            "BufReadPost",
            "BufNewFile",
        },
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
        cmd = "Telescope",
        keys = {
            -- "gd",
            -- "gD",
            -- "gi",
            -- "gr",
            "<S-Enter>",
            "gs",
            "]t",
            "<Leader>;",
            "<Leader>e",
            -- "<Leader>cd",
            -- "<Leader>co",
            "<Leader>fj",
            "<Leader>fg",
            "<Leader>gf",
            "<Leader>gc",
            "<Leader>fr",
            "<Leader>ft",
        },
        config = function()
            require "user.plugins.telescope"
        end
    },

    -- language server protocol
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = { border = vim.g.border_style }
                }
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = true,
            }
        },
        event = {
            "BufReadPost",
            "BufNewFile",
        },
        config = function()
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
                build = "make install_jsregexp"
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
                mode = {"n", "v"},
                desc = "comment line"
            },
            {
                "<leader>/",
                desc = "comment motion"
            },
        },
        init = function ()
            vim.g.kommentary_create_default_mappings = false
        end,
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
        dependencies = {
            -- debugg adapter ui
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    require "user.debugger.ui"
                end,
            }
        },
        config = function()
            require "user.debugger.config"
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
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            require "user.themes.catppuccin"
        end,
    }, ]]
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
        event = "VeryLazy",
        config = function()
            require "user.plugins.lualine"
        end,
    },

    -- git integration
    {
        "lewis6991/gitsigns.nvim",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            require "user.plugins.gitsigns"
        end,
    },

    -- git ui
    {
        "TimUntersberger/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = "Neogit",
        config = true
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

    -- org mode
    {
        "nvim-neorg/neorg",
        dependencies = "nvim-lua/plenary.nvim",
        build = ":Neorg sync-parsers",
        ft = "norg",
        cmd = "Neorg",
        config = function ()
            require "user.plugins.neorg"
        end,
    },
},
{
    ui = {
        border = vim.g.border_style
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                -- "matchparen",
                "tar",
                "tarPlugin",
                "rrhelper",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        }
    },
})
