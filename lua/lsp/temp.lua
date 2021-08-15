local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = 'LuaJIT',
			path = vim.split(package.path, ';'),
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
			[vim.fn.expand('$VIMRUNTIME/lua')] = true,
			[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
			},
			maxPreload = 100000,
			PreloadFileSize = 100000
		},
		telemetry = {
			enable = false
		}
	}
}

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")

  for _, server in pairs(servers) do
    local config = require('lsp.lsp-config').make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"};
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
