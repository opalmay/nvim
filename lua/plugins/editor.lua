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
		cond = not vim.g.vscode,
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
		cond = not vim.g.vscode,
		config = true,
	},
	{
		-- https://github.com/andrewferrier/debugprint.nvim
		"andrewferrier/debugprint.nvim",
		config = true,
		keys = "g?",
	},
	{
		"smjonas/inc-rename.nvim",
		cond = not vim.g.vscode,
		opts = {},
		event = "VeryLazy",
	},
	{
		"roobert/search-replace.nvim",
		config = true,
		keys = {
			{
				"<leader>rs",
				"<CMD>SearchReplaceSingleBufferSelections<CR>",
			},
			{
				"<leader>ro",
				"<CMD>SearchReplaceSingleBufferOpen<CR>",
			},
			{
				"<leader>rw",
				"<CMD>SearchReplaceSingleBufferCWord<CR>",
			},
			{
				"<leader>rW",
				"<CMD>SearchReplaceSingleBufferCWORD<CR>",
			},
			{
				"<leader>re",
				"<CMD>SearchReplaceSingleBufferCExpr<CR>",
			},
			{
				"<leader>rf",
				"<CMD>SearchReplaceSingleBufferCFile<CR>",
			},
			{
				"<leader>rbs",
				"<CMD>SearchReplaceMultiBufferSelections<CR>",
			},
			{
				"<leader>rbo",
				"<CMD>SearchReplaceMultiBufferOpen<CR>",
			},
			{
				"<leader>rbw",
				"<CMD>SearchReplaceMultiBufferCWord<CR>",
			},
			{
				"<leader>rbW",
				"<CMD>SearchReplaceMultiBufferCWORD<CR>",
			},
			{
				"<leader>rbe",
				"<CMD>SearchReplaceMultiBufferCExpr<CR>",
			},
			{
				"<leader>rbf",
				"<CMD>SearchReplaceMultiBufferCFile<CR>",
			},
			{
				"<C-r>",
				"<CMD>SearchReplaceSingleBufferVisualSelection<CR>",
				mode = "v",
			},
			{
				"<C-s>",
				"<CMD>SearchReplaceWithinVisualSelection<CR>",
				mode = "v",
			},
			{
				"<C-b>",
				"<CMD>SearchReplaceWithinVisualSelectionCWord<CR>",
				mode = "v",
			},
		},
	},
	{
		"folke/trouble.nvim",
		cond = not vim.g.vscode,
		opts = {},
		cmd = "TroubleToggle",
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		keys = {
			{ "gc", mode = { "n", "v" } },
			"gbc",
			"gb",
			"gcA",
		},
	},
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		modes = {
	-- 			char = {
	-- 				highlight = { backdrop = false },
	-- 			},
	-- 		},
	-- 	},
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "~",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
	-- 		{ "`",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
	-- 		{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
	-- 		{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	-- 		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	-- 	},
	-- },
	{
		"theKnightsOfRohan/csvlens.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim"
		},
		opts = {},
		cmd = "Csvlens",
	},
	{
		"ixru/nvim-markdown",
		ft = "markdown",
	},
	{
		"theRealCarneiro/hyprland-vim-syntax",
		ft = "hypr"
	},
	{ -- peeks lines of the buffer in non-obtrusive way.
		"nacro90/numb.nvim",
		opts = {},
		VeryLazy = true,
	},
	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {},
	-- }
	-- {
	-- 	"smjonas/live-command.nvim",
	-- 	opts = "",
	-- 	VeryLazy = true,
	-- }
}
