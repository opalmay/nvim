return {
	"nvim-lua/plenary.nvim",
	-- {
	-- 	"vigoux/notifier.nvim",
	-- 	cond = not vim.g.vscode,
	-- 	config = true,
	-- },
	{
		"jghauser/mkdir.nvim",
		cond = not vim.g.vscode,
		event = "BufWritePre",
	},
	{
		"stevearc/stickybuf.nvim",
		cond = not vim.g.vscode,
		config = true,
	},
	{ -- FIXME
		"opalmay/vim-EnhancedJumps",
		init = function()
			vim.g.EnhancedJumps_no_mappings = 1
			vim.g.EnhancedJumps_CaptureJumpMessages = 0
			vim.g.EnhancedJumps_SwitchStrategy = "first"
		end,
		keys = {
			{ "<C-o>",  "<Plug>EnhancedJumpsLocalOlder" },
			{ "<C-i>",  "<Plug>EnhancedJumpsLocalNewer" },
			{ "g<C-o>", "<Plug>EnhancedJumpsRemoteOlder" },
			{ "g<C-i>", "<Plug>EnhancedJumpsRemoteNewer" },
		},
		dependencies = {
			"inkarkat/vim-ingo-library",
		},
	},
	{
		"klen/nvim-config-local",
		cond = not vim.g.vscode,
		config = true,
	},
	{
		"MTDL9/vim-log-highlighting",
		cond = not vim.g.vscode,
		ft = "log",
	},
	{
		"mbbill/undotree",
		cond = not vim.g.vscode,
		cmd = "UndotreeToggle",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = not vim.g.vscode,
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	{
		"RRethy/vim-illuminate",
		cond = not vim.g.vscode,
		config = function()
			require("illuminate").configure({
				filetypes_denylist = { "TelescopePrompt" },
			})
		end,
	},
	{
		"hedyhli/outline.nvim",
		cond = not vim.g.vscode,
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "folke/trouble.nvim", "nvim-telescope/telescope.nvim" }
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {
	-- 		allow_different_key = true,
	-- 	}
	-- },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typing
	{ "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
	{ "OXY2DEV/helpview.nvim", dependencies = "catppuccin/nvim" }
	-- {
	-- 	"lervag/vimtex",
	-- 	-- tag = "v2.15", -- uncomment to pin to a specific release
	-- 	init = function()
	-- 		-- VimTeX configuration goes here
	-- 	end
	-- }
}
