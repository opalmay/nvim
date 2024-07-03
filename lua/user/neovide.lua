if not vim.g.neovide then
	return
end

-- vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10

-- vim.g.neovide_scroll_animation_length = 0
-- vim.g.neovide_cursor_animation_length = 0
-- vim.g.neovide_scroll_animation_length = 0.3
-- vim.g.neovide_cursor_animation_length = 0.13

vim.g.neovide_scroll_animation_far_lines = 1

-- vim.g.neovide_cursor_vfx_mode = "railgun"

-- vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<C-c>", '"+y') -- Copy

vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
vim.keymap.set("i", "<C-s-v>", '<ESC>l"+Pli') -- Paste insert mode
vim.keymap.set("t", "<C-v>", '<C-\\><C-n>"+pa') -- Paste terminal mode
vim.keymap.set("t", "<C-s-v>", '<C-\\><C-n>"+pa') -- Paste terminal mode
-- vim.keymap.set("c", "<C-v>", "<C-r>+") -- Paste command mode
vim.keymap.set("c", "<C-s-v>", "<C-r>+") -- Paste command mode
vim.keymap.set("n", "<C-s-v>", '"+p') -- Paste normal mode

-- vim.api.nvim_create_autocmd("WinNew", {
-- 	callback = function()
-- 		vim.notify("WinNew")
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	callback = function()
-- 		local buf_type = vim.api.nvim_buf_get_option(0, "buftype")
-- 		-- vim.notify("BufLeave: " .. buf_type)
-- 		local buf_exclude = { "terminal", "quickfix", "nofile", "prompt" }
-- 		if not force_anim and not vim.tbl_contains(buf_exclude, buf_type) then
-- 			vim.g.neovide_scroll_animation_length = 0
-- 			vim.g.neovide_cursor_animation_length = 0
-- 		end
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	callback = function()
-- 		vim.fn.timer_start(70, function()
-- 			vim.g.neovide_scroll_animation_length = 0.3
-- 			vim.g.neovide_cursor_animation_length = 0.05
-- 		end)
-- 	end,
-- })

-- create command to toggle animation
