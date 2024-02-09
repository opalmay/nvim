return {
	"nvim-lua/plenary.nvim",
	{
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup()
		end,
	},
	{
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
	},
	{
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup()
		end,
	},
	{ -- FIXME
		"opalmay/vim-EnhancedJumps",
		event = "BufReadPost",
		config = function()
			vim.g.EnhancedJumps_no_mappings = 1
			vim.g.EnhancedJumps_CaptureJumpMessages = 0
			vim.g.EnhancedJumps_SwitchStrategy = "first"
			vim.keymap.set("n", "<C-o>", "<Plug>EnhancedJumpsLocalOlder")
			vim.keymap.set("n", "<C-i>", "<Plug>EnhancedJumpsLocalNewer")
			vim.keymap.set("n", "g<C-o>", "<Plug>EnhancedJumpsRemoteOlder")
			vim.keymap.set("n", "g<C-i>", "<Plug>EnhancedJumpsRemoteNewer")
		end,
		dependencies = {
			"inkarkat/vim-ingo-library",
		},
	},
	{
		"klen/nvim-config-local",
		config = function()
			require("config-local").setup()
		end,
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
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<C-e>",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<C-j>",
				":lua require('harpoon.ui').nav_file(1)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-k>",
				":lua require('harpoon.ui').nav_file(2)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-l>",
				":lua require('harpoon.ui').nav_file(3)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-;>",
				":lua require('harpoon.ui').nav_file(4)<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
