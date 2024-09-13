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

	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" })
	use({ "nvim-pack/nvim-spectre" })

	-- Telescope plugins
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.x" })

	-- Treesitter plugins
	use("tpope/vim-commentary")
	use("nvim-treesitter/playground")

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Git plugins
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")

	use({ "lewis6991/gitsigns.nvim", tag = "v0.7" })

	-- Theme plugins
	use("akinsho/bufferline.nvim")
	use({
		"jesseleite/nvim-noirbuddy",
		requires = {
			"tjdevries/colorbuddy.nvim",
		},
	})

	-- AI Assistant
	use({ "github/copilot.vim", tag = "v1.18.0" })

	-- LSP plugins
	use({ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})

	-- Formatting plugins
	use({
		"nvimtools/none-ls.nvim",
		requires = {
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	})

	-- Tree
	use({ "nvim-tree/nvim-tree.lua", tag = "v1.3.3" })

	-- Cmdline
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
end)
