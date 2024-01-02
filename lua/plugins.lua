return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons plugins
  use 'nvim-tree/nvim-web-devicons'

  -- Utils plugins
  use 'wakatime/vim-wakatime'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'mg979/vim-visual-multi'

  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }

  -- Telescope plugins
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim'
    }
  }

  -- Treesitter plugins
  use 'tpope/vim-commentary'
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-ts-autotag'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Git plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Theme plugins
  use {
    'jesseleite/nvim-noirbuddy',
    requires = {
      'tjdevries/colorbuddy.nvim', branch = 'dev'
    },
  }

  -- Github Copilot plugins
  use 'github/copilot.vim'

  -- LSP plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Formatting plugins
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.8'
  }

  -- Tree
  use 'nvim-tree/nvim-tree.lua'
end)
