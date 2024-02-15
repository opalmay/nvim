if not vim.g.neovide then
	return
end

-- vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_hide_mouse_when_typing = true

-- vim.g.neovide_cursor_vfx_mode = "railgun"

if vim.g.neovide then
	-- vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<C-c>", '"+y') -- Copy
	vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
	vim.keymap.set("n", "<C-V>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
	vim.keymap.set("v", "<C-V>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
