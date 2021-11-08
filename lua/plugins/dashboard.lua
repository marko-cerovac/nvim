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

local pre = 'lua require("core.functions").load_telescope("'
local post = '")'

vim.g.dashboard_custom_section = {
    a = {
            description = {'  File Explorer                     Leader f e'},
            command = pre .. 'Telescope file_browser hidden=true' .. post },
            -- command = 'PackerLoad telescope.nvim |Telescope file_browser hidden=true'},
    b = {
            description = {'  Find File                         Leader f f'},
            command = pre .. 'Telescope find_files' .. post },
    c = {
            description = {'  Recently Used Files               Leader f r'},
            command = pre .. 'Telescope oldfiles' .. post },
    --[[ d = {
            description = {'  Load Last Session                 Leader w l'},
            command = 'SessionLoad'}, ]]
    e = {
            description = {'  Find Word                         Leader f g'},
            command = pre .. 'Telescope live_grep' .. post },
    f = {
            description = {'  Open a Terminal                   Leader t o'},
            command = 'terminal'},
    --[[ g = {
            description = {'  Change Colorscheme                Leader f t'},
            command = 'Telescope colorscheme'}, ]]
    h = {
            description = {'  Settings                          Leader f s'},
            command = pre .. "lua require('plugins.configs.telescope').neovim_rc()" .. post },
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
