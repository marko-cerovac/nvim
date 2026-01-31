-- file
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true

-- formating
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.conceallevel = 2
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.winborder = 'single'
-- vim.g.border_style = 'single'
-- vim.g.border_style = 'rounded'

-- folding
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
-- o.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:N"

-- misc
vim.opt.mouse = 'a'
vim.opt.autochdir = true
vim.opt.smartcase = true
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000
vim.opt.shortmess:append({
    c = true,
    C = true,
    q = true,
})

-- require('vim._extui').enable({
--     enable = true,
--     msg = {
--         -- target = 'cmd'
--         target = 'msg'
--     }
-- })

-- set slower settings async
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'

    -- add hyprlang filetype
    vim.filetype.add {
        pattern = {
            ['.*/hyprland%.conf'] = 'hyprlang',
            ['${XDG_CONFIG_HOME}/hypr/.*%.conf'] = 'hyprlang'
        }
    }
end)
