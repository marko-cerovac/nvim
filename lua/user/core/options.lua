local o = vim.opt

o.swapfile = false
o.writebackup = false
o.autochdir = true
o.clipboard = 'unnamedplus'
o.grepprg = 'rg --vimgrep'
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.smartcase = true
o.conceallevel = 2
o.signcolumn = 'yes'
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.sidescrolloff = 10
o.wrap = false
o.cursorline = true
o.laststatus = 3
o.cmdheight = 0
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.timeoutlen = 1000
o.showmode = false
o.mouse = 'a'
o.foldenable = false
o.foldmethod = 'expr'
o.shortmess:append({c = true, C = true})

o.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

vim.g.border_style = 'rounded'
