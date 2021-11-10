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
            description = {'פּ  File Tree                         Leader e  '},
            command = function ()
            	vim.cmd 'PackerLoad nvim-tree.lua'
				vim.cmd 'NvimTreeToggle'
            end },

    --[[ b = {
            description = {'  Find File                         Leader f f'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
            	vim.cmd 'Telescope find_files'
            end}, ]]

    c = {
            description = {'  File Explorer                     Leader f e'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
            	vim.cmd 'Telescope file_browser hidden=true'
            end},


    d = {
            description = {'  Recently Used Files               Leader f r'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
            	vim.cmd 'Telescope oldfiles'
            end},

    e = {
            description = {'  Find Word                         Leader f g'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
            	vim.cmd 'Telescope live_grep'
            end},

    f = {
            description = {'  Open a Terminal                   Leader t o'},
            command = 'terminal'},

    --[[ g = {
            description = {'  Change Colorscheme                Leader f t'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
            	vim.cmd 'Telescope colorscheme'
            end}, ]]

    h = {
            description = {'  Settings                          Leader f s'},
            command = function ()
				vim.cmd 'PackerLoad telescope.nvim'
				require('plugins.telescope').neovim_rc()
            end},

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
