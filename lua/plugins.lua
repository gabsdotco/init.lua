return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Startup plugins
	use("goolord/alpha-nvim")

	-- Icons plugins
	use("nvim-tree/nvim-web-devicons")

	-- Utils plugins
	use("norcalli/nvim-colorizer.lua")
	use("mg979/vim-visual-multi")

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	-- Telescope plugins
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
	})

	-- Treesitter plugins
	use("tpope/vim-commentary")
	use("nvim-treesitter/playground")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Git plugins
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		tag = "v0.7",
	})

	-- Theme plugins
	use("akinsho/bufferline.nvim")
	use({
		"jesseleite/nvim-noirbuddy",
		requires = {
			"tjdevries/colorbuddy.nvim",
		},
	})

	-- AI Assistant
	use({
		"github/copilot.vim",
		tag = "v1.18.0",
	})

	-- LSP plugins
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Formatting plugins
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8",
	})

	-- Tree
	use({
		"nvim-tree/nvim-tree.lua",
		tag = "v1.3.3",
	})
end)
