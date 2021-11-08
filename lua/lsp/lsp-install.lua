local nvim_lsp = require('lspconfig')

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()

    for _, server in pairs(servers) do
        if server ~= 'lua' then
            nvim_lsp[server].setup{
                on_attach = require('lsp.lsp-config').on_attach,
                capabilities = require('lsp.lsp-config').capabilities,
				flags = {
					debounce_text_changes = 150,
				}
                -- root_dir = vim.loop.cwd
            }
        elseif server == 'lua' then
            nvim_lsp[server].setup {
                -- root_dir = vim.loop.cwd,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                            },
                            maxPreload = 100000,
                            PreloadFileSize = 100000
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            }
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
