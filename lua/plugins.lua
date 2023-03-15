-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons plugins
  use 'kyazdani42/nvim-web-devicons'

  -- Utils plugins
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use 'wakatime/vim-wakatime'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- Prettier plugins
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Fuzzy finder plugins
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- or, branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Treesitter plugins
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "c",
          "lua",
          "rust",
          "javascript",
          "typescript",
          "json",
        },

        sync_install = false,
        auto_install = true,

        ident = {
          enable = true,
        },

        context_commentstring = {
          enable = true,
        },

        highlight = {
          enable = true,
        },
      }
    end
  })

  use('nvim-treesitter/playground')
  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  })

  -- Git plugins
  use('tpope/vim-fugitive')

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        },
      }
    end
  }

  -- Theme plugins
  use {
    "jesseleite/nvim-noirbuddy",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" },
    config = function()
      -- Customised the theme based on this palette / https://calcolor.co/palette/942409461
      require("noirbuddy").setup({
        preset = 'minimal',
        styles = {
          italic = true,
          bold = false,
          underline = false,
          undercurl = true,
        },
        colors = {
          background = "#000000",
          primary = '#333333',
          secondary = '#777777',
          noir_0 = '#f1f1f1',
          noir_1 = '#e2e2e2',
          noir_2 = '#e2e2e2',
          noir_3 = '#a7a7a7',
          noir_4 = '#555555',
          noir_5 = '#444444',
          noir_6 = '#383838',
          noir_7 = '#333333',
          noir_8 = '#222222',
          noir_9 = '#111111',
        },
      })

      require("theme")
    end
  }

  -- Github Copilot configuration
  use "github/copilot.vim"

  -- LSP configuration
  use {
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
  }

  -- Indentation guides
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"

      vim.cmd [[
        highlight IndentBlanklineChar guifg=#1c1c1c
        highlight IndentBlanklineSpaceChar guifg=#1c1c1c
        highlight IndentBlanklineSpaceCharBlankline guifg=#1c1c1c
        highlight IndentBlanklineContextChar guifg=#303030
      ]]

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
      }
    end
  })
end)
