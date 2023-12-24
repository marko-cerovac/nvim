local pickers      = require 'telescope.pickers'
local finders      = require 'telescope.finders'
local conf         = require 'telescope.config'.values
local actions      = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

vim.api.nvim_create_user_command('DapForgetExecutable', function ()
    vim.g.dap_executable = nil
end, {})

return function ()
    if vim.g.dap_executable then
        return vim.g.dap_executable
    end

    local root_patterns = {
        '.git',
        'Makefile',
        'makefile',
        'Cargo.toml',
        'CMakeLists.txt',
        '.clang-format',
        '*.csproj',
        'bin',
    }
    local root_dir = vim.fs.dirname(
        vim.fs.find(root_patterns, {
            upward = true
        })[1]
    )
    return coroutine.create(function(coro)
        local opts = {}
        pickers .new(opts, {
            prompt_title = 'Path to executable',
            finder = finders.new_oneshot_job({
                'fd',
                '--hidden',
                '--no-ignore',
                '--type',
                'x',
                '--base-directory',
                root_dir
            }, {}),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(buffer_number)
                actions.select_default:replace(function()
                    actions.close(buffer_number)
                    vim.g.dap_executable = root_dir .. '/' .. action_state.get_selected_entry()[1]
                    coroutine.resume(coro, vim.g.dap_executable)
                end)
                return true
            end,
        }):find()
    end)
end
