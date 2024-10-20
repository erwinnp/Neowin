return {
	{
		"kyazdani42/nvim-web-devicons",
	},

	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	{ "nvim-lua/plenary.nvim" },

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("neowin.configs.ui.colorscheme")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neowin.configs.ui.neotree")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "BufReadPre",
		config = function()
			require("neowin.configs.ui.lualine")
		end,
	},

	{
		"nvimdev/indentmini.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("indentmini").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				map_bs = true,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("neowin.configs.ui.treesitter")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		event = "BufRead",
		version = "*",
		config = function()
			require("neowin.configs.ui.terminal")
		end,
	},

	{
		"romgrk/barbar.nvim",
		event = "BufRead",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			icons = {
				buffer_index = true,
				modified = { button = "●" },
				pinned = { button = "", filename = true, separator = { right = "" } },
			},
		},
		version = "^1.0.0",
	},

	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("neowin.configs.lsp.lint")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-nvim-lua", -- uncomment if you wanna use nvim lua api
			"hrsh7th/cmp-path",
			{
				"hrsh7th/cmp-vsnip",
				dependencies = "hrsh7th/vim-vsnip",
				config = function()
					require("neowin.configs.completion.snippet")
				end,
			},
		},
		config = function()
			require("neowin.configs.completion.cmp")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("neowin.configs.ui.telescope")
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"j-hui/fidget.nvim",
				tag = "v1.4.0",
				opts = {
					progress = {
						display = {
							done_icon = "✓",
						},
					},
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},
		},
		lazy = false,
		config = function()
			require("neowin.configs.lsp.mason")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("neowin.configs.lsp.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("neowin.configs.lsp.lspconfig")
		end,
	},
}
