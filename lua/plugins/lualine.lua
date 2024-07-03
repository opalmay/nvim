return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	opts = function()
		local components = require("user.lualine_components")
		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					components.mode,
				},
				lualine_b = {
					components.branch,
				},
				lualine_c = {
					components.diff,
					components.filetype,
					components.filename,
					components.python_env,
					components.messages,
					-- "%=",
				},
				lualine_x = {
					-- components.diagnostics,
					"searchcount",
					components.lsp,
				},
				lualine_y = { components.location },
				lualine_z = {
					components.progress,
				},
			},
			inactive_sections = {
				lualine_a = {
					components.mode,
				},
				lualine_b = {
					components.branch,
				},
				lualine_c = {
					components.diff,
					components.python_env,
				},
				lualine_x = {
					components.diagnostics,
					components.lsp,
					components.spaces,
					components.filetype,
				},
				lualine_y = { components.location },
				lualine_z = {
					components.progress,
				},
			},
			tabline = {},
			-- winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { 'filename' },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {}
			-- },
			-- inactive_winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { 'filename' },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {}
			-- },
			extensions = {},
		}
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
