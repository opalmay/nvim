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
		config = function()
			vim.keymap.set("n", "<leader>a", "<CMD>lua require('harpoon.mark').add_file()<CR>")
			vim.keymap.set("n", "<C-e>", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>")
			vim.keymap.set("n", "<C-j>", "<CMD>lua require('harpoon.ui').nav_file(1)<CR>")
			vim.keymap.set("n", "<C-k>", "<CMD>lua require('harpoon.ui').nav_file(2)<CR>")
			vim.keymap.set("n", "<C-l>", "<CMD>lua require('harpoon.ui').nav_file(3)<CR>")
			vim.keymap.set("n", "<C-;>", "<CMD>lua require('harpoon.ui').nav_file(4)<CR>")
		end,
	},
}
