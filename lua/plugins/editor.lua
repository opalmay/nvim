return {
	{
		"nguyenvukhang/nvim-toggler",
		config = function()
			require("nvim-toggler").setup({
				inverses = {
					["True"] = "False",
					["or"] = "and",
					["yes"] = "no",
					["on"] = "off",
					["eq"] = "ne",
					["gt"] = "lt",
					["ge"] = "le",
				},
			})
		end,
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
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
		config = function()
			require("stay-in-place").setup()
		end,
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
		event = "VeryLazy",
	},
	{
		"almo7aya/openingh.nvim",
		cmd = { "OpenInGHRepo", "OpenInGHFile" },
	},
	{
		"axieax/typo.nvim",
		config = function()
			require("typo").setup()
		end,
	},
	{
		-- https://github.com/andrewferrier/debugprint.nvim
		"andrewferrier/debugprint.nvim",
		config = function()
			require("debugprint").setup()
		end,
		keys = "g?",
	},
}
