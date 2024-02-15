return {
	{
		"Bekaboo/dropbar.nvim",
		config = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		event = "LspAttach",
	},
}
