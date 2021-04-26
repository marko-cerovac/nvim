--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/init.lua
--       \/__/         \/__/       Desc: plugin manager settings


local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function (use)
    -- Packer
    use {
        'wbthomason/packer.nvim',
        opt = true
    }

    -- Lsp
    use 'neovim/nvim-lspconfig'                                         -- Lsp configuration
    use 'hrsh7th/nvim-compe'                                            -- Lsp completion
    use 'glepnir/lspsaga.nvim'                                          -- Lsp UI
    use 'onsails/lspkind-nvim'                                          -- Lsp icons

    -- Snippets
    use 'hrsh7th/vim-vsnip'                                             -- Lsp snippets
    use 'hrsh7th/vim-vsnip-integ'                                       -- Lsp snippets integration

    -- Auto pairs
    use 'windwp/nvim-autopairs'                                         -- Auto pairs

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',                                     -- File explorer
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Status line
    use {
        'hoob3rt/lualine.nvim',                                         -- Lualine Status line
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Buffer line
    use {
        'akinsho/nvim-bufferline.lua',                                  -- Bufferline
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',                              -- Tree sitter syntax parser
        run = ':TSUpdate'
    }

    -- Colorscheme
    use 'marko-cerovac/material.nvim'                                   -- Material Colorscheme
    use 'folke/tokyonight.nvim'                                         -- Tokyonight Colorshceme

    -- Git
    use {
        'lewis6991/gitsigns.nvim',                                      -- Git signs
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',                          -- Code indent lines
        branch = 'lua'
    }

    -- Commenting
    use 'b3nj5m1n/kommentary'                                           -- Fast commenting

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'                                   -- Colorsizer

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',                                  -- Telescope search
      requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-fzy-native.nvim'},
      }
    }

end)
