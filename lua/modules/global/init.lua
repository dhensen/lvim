local modules = {}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- UI -----------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ui_config = require('modules.global.configs.ui')

modules['lvim-tech/lvim-colorscheme'] = {
    event = 'VimEnter',
    config = [[vim.cmd('colorscheme lvim')]]
}

modules['glepnir/dashboard-nvim'] = {
    event = 'VimEnter',
    config = ui_config.dashboard
}

-- modules['glepnir/galaxyline.nvim'] = {
--     branch = 'main',
--     config = ui_config.galaxyline,
--     requires = 'kyazdani42/nvim-web-devicons'
-- }

modules['lvim-tech/galaxyline.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    branch = 'exclude_filetypes',
    config = ui_config.galaxyline,
    requires = {{'kyazdani42/nvim-web-devicons', after = 'galaxyline.nvim'}}
}

modules['lukas-reineke/indent-blankline.nvim'] = {
    event = 'BufRead',
    branch = 'lua',
    config = ui_config.indent_blankline
}

modules['kyazdani42/nvim-tree.lua'] = {
    cmd = 'NvimTreeToggle',
    config = ui_config.tree,
    requires = {{'kyazdani42/nvim-web-devicons', opt = true}}
}

modules['vifm/vifm.vim'] = {cmd = 'Vifm'}

modules['norcalli/nvim-colorizer.lua'] = {
    event = "VimEnter",
    config = ui_config.colorize
}

modules['junegunn/goyo.vim'] = {
    cmd = 'Goyo',
    requires = {{'junegunn/limelight.vim', after = 'goyo.vim'}},
    config = ui_config.goyo
}

modules['voldikss/vim-floaterm'] = {config = ui_config.floaterm}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Editor -------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local editor_config = require('modules.global.configs.editor')

modules['vim-ctrlspace/vim-ctrlspace'] = {cmd = 'CtrlSpace'}

modules['windwp/nvim-spectre'] = {
    event = 'VimEnter',
    config = editor_config.spectre,
    requires = {
        {'nvim-lua/popup.nvim', opt = true},
        {'nvim-lua/plenary.nvim', opt = true}
    }
}

modules['lambdalisue/suda.vim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = editor_config.suda
}

modules['terrortylor/nvim-comment'] = {
    cmd = "CommentToggle",
    config = editor_config.comment
}

modules['sbdchd/neoformat'] = {cmd = 'Neoformat'}

modules['windwp/nvim-autopairs'] = {
    after = "nvim-treesitter",
    config = editor_config.autopairs
}

modules['MattesGroeger/vim-bookmarks'] = {
    cmd = 'BookmarkToggle',
    config = editor_config.bookmarks
}

modules['mbbill/undotree'] = {cmd = 'UndotreeToggle'}

modules['kkoomen/vim-doge'] = {
    run = ':call doge#install()',
    config = editor_config.doge
}

modules['lewis6991/gitsigns.nvim'] = {
    event = 'BufReadPre',
    config = editor_config.gitsigns,
    requires = {'nvim-lua/plenary.nvim', opt = true}
}

modules['tpope/vim-fugitive'] = {}

modules['f-person/git-blame.nvim'] = {config = editor_config.blame}

modules['TimUntersberger/neogit'] = {
    cmd = 'Neogit',
    config = editor_config.neogit,
    requires = {'nvim-lua/plenary.nvim', opt = true}
}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Languages ----------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local languages_config = require('modules.global.configs.languages')

modules['neovim/nvim-lspconfig'] = {}

modules['kabouzeid/nvim-lspinstall'] = {}

modules['mfussenegger/nvim-jdtls'] = {}

modules['nvim-treesitter/nvim-treesitter'] = {
    event = 'BufRead',
    config = languages_config.treesitter,
    requires = {{'nvim-treesitter/playground', opt = true}},
    run = ':TSUpdate'
}

modules['pechorin/any-jump.vim'] = {
    event = 'BufRead',
    config = languages_config.jump
}

modules['folke/lsp-trouble.nvim'] = {
    event = 'BufRead',
    requires = {{'kyazdani42/nvim-web-devicons', opt = true}}
    config = languages_config.trouble
}

modules['simrat39/symbols-outline.nvim'] = {
    event = 'BufRead',
    config = languages_config.symbols
}

modules['puremourning/vimspector'] = {opt = true}

modules['mfussenegger/nvim-dap'] = {opt = true}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Completion ---------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local completion_config = require('modules.global.configs.completion')

modules['hrsh7th/nvim-compe'] = {
    event = 'InsertEnter',
    config = completion_config.compe
}

modules['hrsh7th/vim-vsnip'] = {after = 'nvim-compe'}

modules['rafamadriz/friendly-snippets'] = {after = 'nvim-compe'}

modules['onsails/lspkind-nvim'] = {config = completion_config.lspkind}

modules['mattn/emmet-vim'] = {
    event = 'InsertEnter',
    config = completion_config.emmet
}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Tools --------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local tools_config = require('modules.global.configs.tools')

modules['kristijanhusak/vim-dadbod-ui'] = {
    cmd = {
        'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer',
        'DBUIRenameBuffer'
    },
    config = tools_config.vim_dadbod_ui,
    requires = {
        {'tpope/vim-dadbod', opt = true},
        {'kristijanhusak/vim-dadbod-completion', opt = true}
    }
}

modules['AckslD/nvim-whichkey-setup.lua'] = {
    event = {"VimEnter", "BufReadPre"},
    requires = 'liuchengxu/vim-which-key',
    config = tools_config.whichkey
}

modules['iamcco/markdown-preview.nvim'] = {
    event = {"VimEnter", "BufReadPre"},
    run = 'cd app && yarn install'
}

-- modules['airblade/vim-rooter'] = {config = tools_config.rooter}

modules['ahmedkhalf/lsp-rooter.nvim'] = {event = 'VimEnter'}

return modules
