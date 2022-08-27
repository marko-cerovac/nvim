-- load packer
local status_ok, packer = pcall(require, "user.util.packer_init")
if not status_ok then
	vim.notify "Module user.packer_init not found"
	return
end

return packer.startup(
function(use)

	use "wbthomason/packer.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function ()
			require "user.plugins.treesitter"
		end
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" }
		},
		config = function()
			require "user.plugins.telescope"

		end
	}

	-- Language server installer
	use {
		"williamboman/mason.nvim",
		requires = "williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({ ui = { border = vim.g.border_style } })
			require("mason-lspconfig").setup()
		end
	}

	-- Language Server Protocol
	use {
		"neovim/nvim-lspconfig",
		config = function()
			require "user.lsp.config"
		end
	}

	-- Completion engine
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
		},
		config = function()
			require "user.lsp.completion"
		end,
	}

	-- Rust tools
	--[[ use {
		"simrat39/rust-tools.nvim",
		ft = "rust",
		requires = "nvim-lspconfig",
		config = function ()
			require "user.lsp.rust-tools"
		end
	} ]]

	-- Debugg adapter protocol
	use {
		"mfussenegger/nvim-dap",
		keys = {
			"<Leader>b",
			"<M-;>",
			"<Up>",
		},
		config = function ()
			require "user.debugger.config"
		end
	}

	-- Debugg adapter ui
	use {
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap",
		config = function ()
			require "user.debugger.ui"
		end
	}

	-- Colorschemes
	use {
		"marko-cerovac/material.nvim",
		config = function ()
			require "user.themes.material"
		end
	}

	use {
		"rose-pine/neovim",
		as = "rose-pine",
		event = "ColorSchemePre",
		config = function ()
			require "user.themes.rose-pine"
		end
	}

	use {
		"olimorris/onedarkpro.nvim",
		event = "ColorSchemePre",
		config = function ()
			require "user.themes.onedarkpro"
		end
	}

	-- Status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function ()
			require "user.plugins.lualine"
		end
	}

	-- Git integration
	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require "user.plugins.gitsigns"
		end
	}

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
			require("nvim-treesitter.configs").setup { autopairs = {enable = true} }
		end
	}

	-- Git UI
	use {
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		cmd = "Neogit",
		config = function()
			require("neogit").setup{}
		end
	}

	-- Indent line
	use {
		"lukas-reineke/indent-blankline.nvim",
		cmd = "IndentBlanklineToggle",
		config = function()
			require "user.plugins.indentline"
		end
	}

	-- Commenting plugin
	use {
		"b3nj5m1n/kommentary",
		keys = {
			"<Leader>k",
			"<Leader>/",
		},
		setup = function ()
			vim.g.kommentary_create_default_mappings = false
		end,
		config = function ()
			require "user.plugins.kommentary"
		end
	}

	-- Colorizer
	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
	}
end
)
