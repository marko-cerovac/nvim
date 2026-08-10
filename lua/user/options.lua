vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.g.border_style = 'single'

-- buffer saving
vim.opt.confirm = true
vim.opt.swapfile = false

-- indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.breakindent = false

-- window
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
-- vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.conceallevel = 2
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.winborder = vim.g.border_style
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.fillchars:append({ eob = ' ' })

-- folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

-- other
vim.opt.mouse = 'a'
vim.opt.autochdir = true
vim.opt.smartcase = true
vim.opt.grepprg = 'rg --vimgrep'
vim.o.inccommand = 'split'
vim.opt.shortmess:append({q = true})

require('vim._core.ui2').enable({})

-- slower settings
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)
