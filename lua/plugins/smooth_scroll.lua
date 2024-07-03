return {
	{
		"opalmay/vim-smoothie",
		cond = not vim.g.neovide,
		-- cond = not vim.g.neovide and not vim.g.vscode,
		init = function()
			vim.g.smoothie_remapped_commands = {
				"zz",
				"H",
				"M",
				"L",
				"{",
				"}",
				"j",
				"k",
				"<ScrollWheelDown>",
				"<ScrollWheelUp>",
				"n",
				"N",
				"#",
				"*",
			}
			vim.g.smoothie_hide_cursor = not vim.g.neovide
			-- vim.g.smoothie_speed_linear_factor = 35
		end,
	},
	{
		"opalmay/neoscroll.nvim",
		-- "karb94/neoscroll.nvim",
		branch = "feat-scroll-past-bottom",
		-- cond = not vim.g.neovide and not vim.g.vscode,
		cond = not vim.g.neovide,
		config = function()
			require("neoscroll").setup({
				scroll_past_bottom = false,
				hide_cursor = not vim.g.neovide,
				easing_function = "cubic",
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
			})
		end,
	},
}
