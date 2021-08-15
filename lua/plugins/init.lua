local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Ensure packer is installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

local packer = require 'packer'

return packer.startup(
    function(use)

		use 'wbthomason/packer.nvim'

		use 'marko-cerovac/material.nvim'

		use {
			'nvim-treesitter/nvim-treesitter',
			-- run = ':TSUpdate',
            config = function ()
                require 'plugins.treesitter'
            end
		}

		-- Language Server Protocol
        use {
            'neovim/nvim-lspconfig',
            config = function()
                require 'lsp.lsp-config'
            end
        }

		-- Language server installer
        use {
            'kabouzeid/nvim-lspinstall',
			after = 'nvim-lspconfig',
            config = function()
                require 'lsp.lsp-install'
            end
        }

		-- Completion engine
        use {
            'hrsh7th/nvim-compe',
            event = 'InsertEnter',
            config = function()
                require 'lsp.compe'
            end,
        }

		-- Completion symbols
        use {
            'onsails/lspkind-nvim',
            after = 'nvim-compe',
            config = function()
                require 'lsp.lspkind'
            end
        }

		-- Lsp Diagnostics
		use {
			'folke/lsp-trouble.nvim',
			after = 'nvim-lspconfig',
			requires = 'kyazdani42/nvim-web-devicons',
            config = function ()
                require 'lsp.lsptrouble'
            end
		}

		-- Snippets
		use {
			'hrsh7th/vim-vsnip',
            event = 'InsertCharPre'
		}
		use {
			'hrsh7th/vim-vsnip-integ',
			requires = 'vim-vsnip',
            event = 'InsertCharPre'
		}

		-- Debugg adapter protocol
		use {
			'mfussenegger/nvim-dap',
			-- event = 'UIEnter',
			-- cmd = 'Debugg',
			keys = { '<leader>d' },
			config = function ()
				require('debugger.dap-config')
			end
		}

		-- Debugg adapter ui
		use {
			'rcarriga/nvim-dap-ui',
			after = 'nvim-dap',
			cmd = 'Debugg',
			config = function ()
				require('debugger.dap-ui')
			end
		}

		-- Autopairs
        use {
            'windwp/nvim-autopairs',
            after = 'nvim-compe',
            config = function()
                require 'plugins.autopairs'
            end,
        }

		-- Status line
		use {
			'hoob3rt/lualine.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
            event = 'BufWinEnter',
            -- event = 'BufRead',
            config = function ()
                require 'plugins.lualine'
            end
		}

		-- Which key
		use {
			'folke/which-key.nvim',
			event = 'BufWinEnter',
			config = function()
				require'plugins.whichkey'
			end
		}

		-- Buffer line
		--[[ use {
			'akinsho/nvim-bufferline.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			after = 'material.nvim'
		} ]]

		-- File tree explorer
        use {
            'kyazdani42/nvim-tree.lua',
			-- event = 'VimEnter',
            cmd = 'NvimTreeToggle',
            config = function()
                require 'plugins.nvim-tree'
            end
        }

		-- Telescope
        use {
            'nvim-telescope/telescope.nvim',
			requires = {
				{'nvim-lua/popup.nvim'},
				{'nvim-lua/plenary.nvim'},
				{'nvim-telescope/telescope-fzy-native.nvim'},
				{'nvim-telescope/telescope-media-files.nvim'}
			},
            event = 'UIEnter',
            config = function()
                require 'plugins.telescope'
            end
        }

		-- Git signs
        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require 'plugins.gitsigns'
            end
        }

		-- Git UI
		use {
			'TimUntersberger/neogit',
			requires = 'nvim-lua/plenary.nvim',
			cmd = 'Neogit',
            config = function()
                require 'plugins.neogit'
            end
		}

		-- Startscreen
        use {
            'glepnir/dashboard-nvim',
			event = 'VimEnter',
			-- event = 'UIEnter',
            setup = function()
                require 'plugins.dashboard'
            end
        }

		-- Indent line
        use {
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            setup = function()
                require'plugins.indent-blankline'
            end
        }

		-- Commenting
		use {
			'b3nj5m1n/kommentary',
			event = 'BufRead',
			config = function()
				require'plugins.kommentary'
			end
		}

		-- Colorizer
		use {
			'norcalli/nvim-colorizer.lua',
			cmd = {
                'ColorizerAttachToBuffer',
                'ColorizerToggle'
            },
            config = function ()
              require'plugins.colorizer'
            end
		}

		-- Org mode
		use {
			'vhyrro/neorg',
			ft = 'norg',
			requires = 'nvim-lua/plenary.nvim',
            config = function ()
                require'plugins.neorg'
            end
		}
	end)
