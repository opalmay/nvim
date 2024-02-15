return {
	"nvim-lua/plenary.nvim",
	{
		"vigoux/notifier.nvim",
		config = true,
	},
	{
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
	},
	{
		"stevearc/stickybuf.nvim",
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
		config = true,
	},
	{
		"MTDL9/vim-log-highlighting",
		ft = "log",
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>a", "<CMD>lua require('harpoon.mark').add_file()<CR>" },
			{ "<C-e>",     "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
			{ "<C-j>",     "<CMD>lua require('harpoon.ui').nav_file(1)<CR>" },
			{ "<C-k>",     "<CMD>lua require('harpoon.ui').nav_file(2)<CR>" },
			{ "<C-l>",     "<CMD>lua require('harpoon.ui').nav_file(3)<CR>" },
			{ "<C-;>",     "<CMD>lua require('harpoon.ui').nav_file(4)<CR>" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = { "TelescopePrompt" }
			})
		end,
	},
}
