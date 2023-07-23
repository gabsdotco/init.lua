return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons plugins
  use 'kyazdani42/nvim-web-devicons'

  -- Utils plugins
  use 'wakatime/vim-wakatime'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'

  -- Telescope plugins
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    }
  }

  -- Treesitter plugins
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-ts-autotag'

  -- Git plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Theme plugins
  use {
    "jesseleite/nvim-noirbuddy",
    requires = {
      "tjdevries/colorbuddy.nvim", branch = "dev"
    },
  }

  -- Github Copilot plugins
  use 'github/copilot.vim'

  -- LSP plugins
  use({
    'VonHeikemen/lsp-zero.nvim',
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
  })

  -- Formatting plugins
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
end)
