return require('packer').startup(function(use)
    -- packer can manage itself
    use {
        'wbthomason/packer.nvim',
        run = ':PackerSync'
    }


    -- plugins --

    -- tokyonight color themes --
    use 'folke/tokyonight.nvim'

    -- nvim-web-devicons --
    use 'kyazdani42/nvim-web-devicons'

    -- nvim-lualine --
    use { 'nvim-lualine/lualine.nvim',
        require = { 'kyazdani42/nvim-web-devicons' }
    }

    -- rainbow --
    use 'luochen1990/rainbow'

    -- nvim-cursorline --
    use 'yamatsum/nvim-cursorline'

    -- dashboard --
    use 'glepnir/dashboard-nvim'

    -- vim-devicons --
    use 'ryanoasis/vim-devicons'

    -- nvim-tree --
    use {
        'kyazdani42/nvim-tree.lua',
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- comment --
    use 'numToStr/Comment.nvim'

    -- todo-comment --
    use {
        'folke/todo-comments.nvim',
        require = 'nvim-lua/plenary.nvim'
    }

    -- bufferline --
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- nvim-autopairs --
    use 'windwp/nvim-autopairs'

    -- neoscroll --
    use 'karb94/neoscroll.nvim'

    -- better-escape --
    use 'max397574/better-escape.nvim'

    -- nvim-scrollbar --
    use 'petertriho/nvim-scrollbar'

    -- toggleterm.nvim --
    use {
        'akinsho/toggleterm.nvim',
        tag = "main",
    }

    -- undotree --
    use 'mbbill/undotree'

    -- calendar --
    -- use 'itchyny/calendar.vim'

    -- indent-blankline --
    use 'lukas-reineke/indent-blankline.nvim'

    -- gitsigns --
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate'
    }

    -- spellsitter --
    use 'lewis6991/spellsitter.nvim'

    -- telescope --
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }

    -- trouble.nvim --
    use {
        "folke/trouble.nvim",
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- vista --
    use 'liuchengxu/vista.vim'

    -- dressing.nvim
    use 'stevearc/dressing.nvim'

    -- persistence.nvim
    use 'folke/persistence.nvim'

    -- bigfile.nvim
    use 'LunarVim/bigfile.nvim'

    -- new lsp config --
    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    }

    -- lsp ui --
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    -- nvim-navic
    use {
        'SmiteshP/nvim-navic',
        requires = 'neovim/nvim-lspconfig'
    }

    -- nvim-cmp --
    use 'hrsh7th/cmp-nvim-lsp' --nvim_lsp
    use 'hrsh7th/cmp-buffer' --buffer
    use 'hrsh7th/cmp-path' --path
    use 'hrsh7th/cmp-cmdline' --cmdline
    use 'hrsh7th/nvim-cmp'
    use 'ray-x/lsp_signature.nvim'
    use 'lukas-reineke/cmp-under-comparator'


    -- vsnip --
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- lspkind --
    use 'onsails/lspkind-nvim'

    -- debugger
    use {
        'ravenxrz/DAPInstall.nvim',
        'ravenxrz/nvim-dap',
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
    }

    -- vimwiki
    use {
        'vimwiki/vimwiki'
    }

    -- inlay-hints
    use 'simrat39/inlay-hints.nvim'

    -- rust-tools
    use 'simrat39/rust-tools.nvim'

    -- rust.vim
    use 'rust-lang/rust.vim'

    -- vim-startuptime
    use 'dstein64/vim-startuptime'
end)
