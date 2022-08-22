local status_ok, actions = pcall(require, "telescope.actions")
if not status_ok then
	vim.notify "Module telescope.actions not found"
	return
end
local builtin = require "telescope.builtin"
local action_state = require "telescope.actions.state"

local functions = {}

-- Buffers with delete option
functions.buffers = function()
  builtin.buffers{
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end

      map("i", "<c-u>", delete_buf)
      map("n", "x", delete_buf)


      return true
    end
  }
end

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

