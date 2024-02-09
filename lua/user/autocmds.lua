-- autocmd to not auto comment new line
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "github.com_*.txt",
	command = "set filetype=markdown",
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "solarwinds.nice.com_*.txt",
	command = "set filetype=ps1",
})
-- On command line leave, clear the command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = ":",
	command = "echo ''",
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "sxhkdrc",
	command = "set filetype=sxhkdrc",
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.txt" },
	command = "set spell",
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.lua" },
	command = "set nospell",
})
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
-- Add last insert position to jump list
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.cmd("norm m`")
	end,
})
