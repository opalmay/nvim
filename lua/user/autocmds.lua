-- Add last insert position to jump list
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.cmd("norm m`")
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

if vim.g.vscode then
	return
end

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

-- -- Format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		local tmp = vim.notify
-- 		vim.notify = function() end
-- 		vim.lsp.buf.format()
-- 		vim.notify = tmp
-- 	end,
-- })

if vim.fn.has("linux") == 1 then
	-- sync with system clipboard on focus
	vim.api.nvim_create_autocmd({ "FocusGained" }, {
		pattern = { "*" },
		command = [[call setreg("@", getreg("+"))]],
	})
	vim.api.nvim_create_autocmd({ "FocusLost" }, {
		pattern = { "*" },
		command = [[call setreg("+", getreg("@"))]],
	})
end
