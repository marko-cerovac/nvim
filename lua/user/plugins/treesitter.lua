require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp", "make", "lua", "rust", "bash", "java" },
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "vnn",
			node_incremental = "gnn",
			scope_incremental = "gns",
			node_decremental = "gnd",
		},
	},
	-- indent = {
	-- 	enable = true
	-- },
}

vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
