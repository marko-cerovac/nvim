local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	vim.notify "Module telescope.actions not found"
	return
end

local functions = {}

-- NeoVim settings
functions.neovim_settings = function ()
    builtin.find_files({
        prompt_title = "NeoVim Settings",
        cwd = vim.fn.stdpath "config" .. "/lua/user",
    })
end

functions.material_styles = function ()
	builtin.planets({

	})
end

return functions

