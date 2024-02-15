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
		opts = {
			highlight = {
				on_put = false,
				on_yank = false,
				timer = 40,
			},
		},
		keys = {
			{ -- Add indent?
				"p",
				"<Plug>(YankyPutAfter)",
				mode = { "n", "x" },
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				mode = { "n", "x" },
			},
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				mode = { "n", "x" },
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				mode = { "n", "x" },
			},
			{
				"<c-p>",
				"<Plug>(YankyCycleBackward)",
			},
			{
				"<c-n>",
				"<Plug>(YankyCycleForward)",
			},
			{ -- Stay in place
				"y",
				"<Plug>(YankyYank)",
				mode = { "n", "x" },
			},
		},
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({
				yank_substituted_text = true,
				on_substitute = require("yanky.integration").substitute(),
			})
		end,
		keys = {
			{
				"s",
				function()
					require("substitute").operator()
				end,
			},
			{
				"ss",
				function()
					require("substitute").line()
				end,
			},
			{
				"S",
				function()
					require("substitute").eol()
				end,
			},
			{
				"s",
				function()
					require("substitute").visual()
				end,
				mode = "x",
			},
		},
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
