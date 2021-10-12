vim.g.dashboard_default_executive = 'telescope.nvim'

vim.g.dashboard_custom_header = {
    [[                                                                  ]],
    [[                                                                  ]],
    [[                                                                  ]],
    [[                                                                  ]],
    [[                                                                  ]],
    [[                         .|.            |.                        ]],
    [[                       .cc|:;           |::.                      ]],
    [[                     .cccc|:::;         |::::.                    ]],
    [[                    |ccccc|::::;        |:::::|                   ]],
    [[                    |ccccc|::::::;      |:::::|                   ]],
    [[         ___        |ccccc|:::::::;     |:::::|         ___       ]],
    [[        /\  \       |ccccc| ;:::::::;   |:::::|        /\__\      ]],
    [[       |::\  \      |ccccc|  ;:::::::;  |:::::|       /:/  /      ]],
    [[       |:|:\  \     |ccccc|   ;:::::::; |:::::|      /:/  /       ]],
    [[     __|:|\:\  \    |ccccc|     ;:::::::|:::::|     /:/  /  ___   ]],
    [[    /::::|_\:\__\   |ccccc|      ;::::::|:::::|    /:/__/  /\__\  ]],
    [[    \:\~~\  \/__/   |ccccc|        ;::::|:::::|    \:\  \ /:/  /  ]],
    [[     \:\  \          .cccc|         ;:::|::::.      \:\  /:/  /   ]],
    [[      \:\  \           .cc|           ;;|::.         \:\/:/  /    ]],
    [[       \:\__\            .|            .|.            \::/  /     ]],
    [[        \/__/                                          \/__/      ]],
    [[                                                                  ]],
    [[                                                                  ]],
    [[                            N E O V I M                           ]]
}

-- vim.g.dashboard_disable_statusline = 1

vim.g.dashboard_custom_section = {
    a = {
            description = {'  File Explorer                     Leader f e'},
            command = 'Telescope file_browser hidden=true'},
    b = {
            description = {'  Find File                         Leader f f'},
            command = 'Telescope find_files'},
    c = {
            description = {'  Recently Used Files               Leader f r'},
            command = 'Telescope oldfiles'},
    --[[ d = {
            description = {'  Load Last Session                 Leader w l'},
            command = 'SessionLoad'}, ]]
    e = {
            description = {'  Find Word                         Leader f g'},
            command = 'Telescope live_grep'},
    f = {
            description = {'  Open a Terminal                   Leader t o'},
            command = 'terminal'},
    --[[ g = {
            description = {'  Change Colorscheme                Leader f t'},
            command = 'Telescope colorscheme'}, ]]
    h = {
            description = {'  Settings                          Leader f s'},
            command = [[lua require('plugins.configs.telescope').neovim_rc()]]},
    i = {
            description = {'  Quit                                        '},
            command = 'q!'}
}

vim.g.dashboard_session_directory = "~/.cache/vim/session"

vim.g.dashboard_custom_footer = {
	"The editor of the Beast"
}

-- vim.api.nvim_set_keymap('n', '<leader>wl', [[<cmd>SessionLoad<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>wa', [[<cmd>SessionSave<CR>]], { noremap = true, silent = true })
