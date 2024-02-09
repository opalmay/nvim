return {
	{
		"nguyenvukhang/nvim-toggler",
		opts = {
			inverses = {
				["True"] = "False",
				["or"] = "and",
				["yes"] = "no",
				["on"] = "off",
				["eq"] = "ne",
				["gt"] = "lt",
				["ge"] = "le",
			},
		},
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		config = true,
		keys = { "ys", "cs", "ds" },
		event = "VeryLazy",
	},
	{
		"gbprod/yanky.nvim",
		event = "User FileOpened",
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = false,
					on_yank = false,
					timer = 40,
				},
			})
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)") -- Add indent?
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
			vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
			vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)") -- Stay in place
		end,
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({
				yank_substituted_text = true,
				on_substitute = require("yanky.integration").substitute(),
			})
			vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>")
			vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>")
			vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>")
			vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>")
		end,
		lazy = true,
	},
	{
		"gbprod/stay-in-place.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"almo7aya/openingh.nvim",
		cmd = { "OpenInGHRepo", "OpenInGHFile" },
	},
	{
		"axieax/typo.nvim",
		config = true,
	},
	{
		-- https://github.com/andrewferrier/debugprint.nvim
		"andrewferrier/debugprint.nvim",
		config = true,
		keys = "g?",
	},
}
