-- neovim config
-- author: Marko Cerovac
-- repo:   https://github.com/marko-cerovac/nvim

if vim.g.vscode then
    return
end

require 'user.core.options'

require 'user.core.mappings'

require 'user.core.autocmds'

-- require 'user.core.statusline'

require 'user.core.lazy'

if vim.g.neovide then
    require 'user.util.neovide'
end
