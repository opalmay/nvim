return {
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		config = function()
			require("dropbar").setup()
		end,
		dependencies = {
			"nvimtree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
}
