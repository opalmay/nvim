return {
	{
		"opalmay/vim-smoothie",
		cond = not vim.g.neovide,
	},
	{
		"opalmay/neoscroll.nvim",
		branch = "feat-scroll-past-bottom",
		cond = not vim.g.neovide,
		config = function()
			if vim.g.neovide then
				vim.g.smoothie_remapped_commands =
					{ "zz", "H", "M", "L", "{", "}", "<ScrollWheelDown>", "<ScrollWheelUp>", "#", "*" }
				-- { "zz", "H", "M", "L", "{", "}", "j", "k", "<ScrollWheelDown>", "<ScrollWheelUp>", "#", "*" }
			else
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
				require("neoscroll").setup({
					scroll_past_bottom = false,
					hide_cursor = not vim.g.neovide,
					easing_function = "cubic",
					mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
				})
			end
			vim.g.smoothie_hide_cursor = not vim.g.neovide
		end,
	},
}
