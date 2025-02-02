return {
	"nvim-telescope/telescope.nvim",
	cond = not vim.g.vscode,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- {
		-- 	"ahmedkhalf/project.nvim",
		-- 	main = "project_nvim",
		-- 	opts = {},
		-- 	dependencies = "telescope.nvim"
		-- },
		{ "jvgrootveld/telescope-zoxide" },
	},

	config = true,
	opts = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.load_extension("zoxide")
		return {
			extensions = {
				zoxide = {
					mappings = {
						default = {
							-- action = function(selection)
							-- 	vim.cmd.tcd(selection.path)
							-- end,
							-- after_action = function(selection)
							-- 	vim.cmd.tcd(selection.path)
							-- 	-- print("Update! to (" .. selection.z_score .. ") " .. selection.path)
							-- end
						},
					},
				},
			},
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = nil,
			layout_strategy = nil,
			layout_config = {},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
			---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
			mappings = {
				i = {
					["<C-n>"] = actions.move_selection_next,
					["<C-p>"] = actions.move_selection_previous,
					["<C-c>"] = actions.close,
					["<C-j>"] = actions.cycle_history_next,
					["<C-k>"] = actions.cycle_history_prev,
					["<C-q>"] = function(...)
						actions.smart_send_to_qflist(...)
						actions.open_qflist(...)
					end,
					["<CR>"] = actions.select_default,
				},
				n = {
					["<C-n>"] = actions.move_selection_next,
					["<C-p>"] = actions.move_selection_previous,
					["<C-q>"] = function(...)
						actions.smart_send_to_qflist(...)
						actions.open_qflist(...)
					end,
				},
			},
			defaults = {
				file_ignore_patterns = { ".git", "node_modules", "vendor" },
			},
			path_display = { "smart" },
			winblend = 0,
			border = {},
			borderchars = nil,
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		}
	end,
	keys = {
		{
			"<leader>p",
			function()
				require("telescope").extensions.projects.projects({})
			end,
		},
		{
			"<leader>z",
			function()
				require("telescope").extensions.zoxide.list()
			end,
		},
		{
			"<leader>f",
			function()
				local opts = { hidden = true, show_untracked = true }
				if not pcall(function()
							require("telescope.builtin").git_files(opts)
						end) then
					require("telescope.builtin").find_files(opts)
				end
			end,
		},
		{
			"<C-t>",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
			end,
		},
		{
			"<leader>sW",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
			end,
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })
			end,
		},
		{
			"<leader>vh",
			function()
				require("telescope.builtin").help_tags()
			end,
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
		},
	},
	cmd = "Telescope",
}
