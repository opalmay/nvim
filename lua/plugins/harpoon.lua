-- function nav_file_no_anim(index)
-- 	vim.g.neovide_scroll_animation_length = 0
-- 	vim.g.neovide_cursor_animation_length = 0
-- 	local harpoon_ui = require("harpoon.ui")
-- 	harpoon_ui.nav_file(index)
-- 	vim.fn.timer_start(70, function()
-- 		vim.g.neovide_scroll_animation_length = 0.3
-- 		vim.g.neovide_cursor_animation_length = 0.05
-- 	end)
-- end

return {
	{
		"ThePrimeagen/harpoon",
		cond = not vim.g.vscode,
		keys = {
			{ "<leader>a", "<CMD>lua require('harpoon.mark').add_file()<CR>" },
			{ "<C-e>",     "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
			{ "<C-j>",     "<CMD>lua require('harpoon.ui').nav_file(1)<CR>" },
			{ "<C-k>",     "<CMD>lua require('harpoon.ui').nav_file(2)<CR>" },
			{ "<C-l>",     "<CMD>lua require('harpoon.ui').nav_file(3)<CR>" },
			{ "<C-;>",     "<CMD>lua require('harpoon.ui').nav_file(4)<CR>" },
			-- { "<C-j>",     "<CMD>lua nav_file_no_anim(1)<CR>" },
			-- { "<C-k>",     "<CMD>lua nav_file_no_anim(2)<CR>" },
			-- { "<C-l>",     "<CMD>lua nav_file_no_anim(3)<CR>" },
			-- { "<C-;>",     "<CMD>lua nav_file_no_anim(4)<CR>" },
			-- { ";",     "<CMD>lua nav_file_no_anim(4)<CR>" },
		},
	},
}
