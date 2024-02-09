return {
	{
		"opalmay/vim-smoothie",
	},
	{
		"opalmay/neoscroll.nvim",
		branch = "feat-scroll-past-bottom",
		config = function()
			if vim.g.neovide then
				vim.g.smoothie_remapped_commands =
					{ "zz", "H", "M", "L", "{", "}", "j", "k", "<ScrollWheelDown>", "<ScrollWheelUp>", "#", "*" }
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