-- author: Marko Cerovac
-- repo:   https://github.com/marko-cerovac/nvim

vim.loader.enable()

require 'user.options'

require 'user.mappings'

require 'user.autocmds'

require 'user.statusline'

require 'user.lazy'

if vim.g.neovide then
    require 'user.clients.neovide'
end
