require('nvim-autopairs').setup({
    check_ts = false
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

require('nvim-treesitter.configs').setup {
    autopairs = {enable = true}
}
