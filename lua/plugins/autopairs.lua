require('nvim-autopairs').setup({
    check_ts = true
})

require('nvim-treesitter.configs').setup {
    autopairs = {enable = true}
}
