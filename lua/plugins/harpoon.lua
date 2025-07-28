return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",     -- also try out "git_branch"
		status = true,
		win_opts = {
			width = 60,
			border = "rounded",
			footer = ""
		}
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>a", "<cmd>Grapple toggle<cr>",          desc = "Tag a file" },
		{ "<c-e>",     "<cmd>Grapple toggle_tags<cr>",     desc = "Toggle tags menu" },

		{ "<c-j>",     "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
		{ "<c-k>",     "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
		{ "<c-l>",     "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
		{ "<c-;>",     "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },

		{ "<c-s-j>",   "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<c-s-k>",   "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
-- return {
-- 	{
-- 		"ThePrimeagen/harpoon",
-- 		keys = {
-- 			{ "<leader>a", "<CMD>lua require('harpoon.mark').add_file()<CR>" },
-- 			{ "<C-e>",     "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
-- 			{ "<C-j>",     "<CMD>lua require('harpoon.ui').nav_file(1)<CR>" },
-- 			{ "<C-k>",     "<CMD>lua require('harpoon.ui').nav_file(2)<CR>" },
-- 			{ "<C-l>",     "<CMD>lua require('harpoon.ui').nav_file(3)<CR>" },
-- 			{ "<C-;>",     "<CMD>lua require('harpoon.ui').nav_file(4)<CR>" },
-- 		},
-- 	},
-- }
-- return {
-- 	{
-- 		"ThePrimeagen/harpoon",
-- 		branch = "harpoon2",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			local harpoon = require("harpoon")
--
-- 			-- REQUIRED
-- 			harpoon:setup()
-- 			-- REQUIRED
--
-- 			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- 			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- 			vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
-- 			vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
-- 			vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
-- 			vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
--
-- 			-- Toggle previous & next buffers stored within Harpoon list
-- 			vim.keymap.set("n", "<C-S-j>", function() harpoon:list():prev() end)
-- 			vim.keymap.set("n", "<C-S-k>", function() harpoon:list():next() end)
-- 		end,
-- 		-- keys = {
-- 		-- 	{ "<leader>a", "<CMD>lua require('harpoon.mark').add_file()<CR>" },
-- 		-- 	{ "<C-e>",     "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
-- 		-- 	{ "<C-j>",     "<CMD>lua require('harpoon.ui').nav_file(1)<CR>" },
-- 		-- 	{ "<C-k>",     "<CMD>lua require('harpoon.ui').nav_file(2)<CR>" },
-- 		-- 	{ "<C-l>",     "<CMD>lua require('harpoon.ui').nav_file(3)<CR>" },
-- 		-- 	{ "<C-;>",     "<CMD>lua require('harpoon.ui').nav_file(4)<CR>" },
-- 		-- },
-- 	},
-- }
