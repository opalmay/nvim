return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<C-CR>",
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 0,
				keymap = {
					accept = "<Right>",
					-- accept = "<C-l>",
					-- accept_word = false,
					accept_line = "<C-l>",
					accept_word = "<C-S-l>",
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-->",
				},
			},
			filetypes = {
				yaml = false,
				markdown = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})
	end,
}
