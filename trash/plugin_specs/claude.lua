return {
    {
        "coder/claudecode.nvim",
        lazy = true,
        cmd = {
            'ClaudeCode',
            'ClaudeCodeFocus',
            'ClaudeCodeAdd',
            'ClaudeCodeSend',
            'ClaudeCodeSelectModel',
        },
        keys = {
            { '<Leader>cc', '<cmd>ClaudeCode<CR>' },
            { '<Leader>cr', '<cmd>ClaudeCode --resume<CR>'},
            { '<Leader>cf', '<cmd>ClaudeCodeFocus<CR>'}
        },
        opts = {
            terminal_cmd = "claude",
            terminal = {
                provider = 'native',
                split_width_percentage = 0.40,
            },
            diff_opts = {
                open_in_new_tab = true,
                -- keep_terminal_focus = true,
            }
        }
    }
}
