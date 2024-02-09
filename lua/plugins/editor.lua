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
}
