-- Automatically install packer.nvim
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		"git",
		"clone",
		"--depth 1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	vim.notify "Installing packer.nvim."
	vim.cmd "packadd packer.nvim"
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify "Plugin packer not found"
end

-- make packer use a floating window
packer.init({
	display = {
		prompt_border = vim.g.border_style,
		open_fn = function ()
			return require("packer.util").float { border = vim.g.border_style }
		end
	}
})

return packer
