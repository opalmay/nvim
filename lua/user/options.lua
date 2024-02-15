vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.clipboard = ""
-- vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
-- vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
-- vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
-- vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 3 -- unified status bar
vim.opt.mousescroll = "ver:10"
vim.opt.mousemodel = "popup"
-- vim.opt.spell = true
vim.opt.mousemoveevent = true
vim.opt.pumheight = 10
vim.opt.tabstop = 2
-- vim.opt.shortmess = "a"
vim.opt.shortmess = vim.opt.shortmess
	+ {
		c = true, -- Do not show completion messages in command line
		F = true, -- Do not show file info when editing a file, in the command line
		W = true, -- Do not show "written" in command line when writing
		I = true, -- Do not show intro message when starting Vim
	}

vim.opt.title = true
vim.opt.showcmd = false
vim.opt.ruler = false
-- vim.cmd("set laststatus=2")
-- vim.opt.startofline = true

-- vim.opt.autochdir = true;

-- vim.opt.shortmess:append("c")
--vim.g.nord_borders = true

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- -- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- require("catppuccin").setup({
--   transparent_background = true
-- })
-- vim.cmd "colorscheme catppuccin"

--vim.api.nvim_exec("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", false)
-- vim.g.lf_replace_netrw = 1

vim.g.gitblame_enabled = 0
vim.g.suda_smart_edit = 1

-- doesn't work idk :h disable-mouse
vim.cmd("aunmenu PopUp.-1-")

if not vim.g.neovide then
	vim.cmd([[    let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
]])
end

-- vim.cmd([[
--   let g:clipboard = {
--         \   'name': 'win32yank_nvim',
--         \   'copy': {
--         \      '+': 'win32yank.exe -i --crlf',
--         \      '*': 'win32yank.exe -i --crlf',
--         \    },
--         \   'paste': {
--         \      '+': 'win32yank.exe -o --lf',
--         \      '*': 'win32yank.exe -o --lf',
--         \   },
--         \   'cache_enabled': 1,
--         \ }
-- ]])

-- -- sync with system clipboard on focus
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("@", getreg("+"))]],
-- })

-- -- sync with system clipboard on focus
-- vim.api.nvim_create_autocmd({ "FocusLost" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("+", getreg("@"))]],
-- })
