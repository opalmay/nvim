return {
	{
		"akinsho/toggleterm.nvim",
		cond = not vim.g.vscode,
		version = "*",
		keys = {
			{
				"<M-r>",
				"<CMD>ToggleTerm direction=float<CR>",
				mode = { "n", "t" }
			},
			{
				"<M-y>",
				"<CMD>ToggleTerm direction=horizontal<CR>",
				mode = { "n", "t" }
			},
			-- {
			-- 	"<C-x>",
			-- 	"<CMD>ToggleTermSendVisualSelection<CR>",
			-- 	mode = { "v" }
			-- },
			-- {
			-- 	"<C-x>",
			-- 	"<CMD>ToggleTermSendCurrentLine<CR>",
			-- 	mode = { "n" }
			-- },
			-- {
			-- 	"<C-x>",
			-- 	"<CMD>ToggleTermSendVisualLines<CR>",
			-- 	mode = { "V" }
			-- }
		},
		opts = {
			autochdir = true,
			shell = vim.o.shell,
			-- shell = "tmux attach -t 'nvim' || tmux new -s 'nvim'",
		},
	},
}
