return {
	"nvim-lua/plenary.nvim",
	{
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup()
		end,
	},
	{
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
	},
	{
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<C-e>",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<C-j>",
				":lua require('harpoon.ui').nav_file(1)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-k>",
				":lua require('harpoon.ui').nav_file(2)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-l>",
				":lua require('harpoon.ui').nav_file(3)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-;>",
				":lua require('harpoon.ui').nav_file(4)<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
