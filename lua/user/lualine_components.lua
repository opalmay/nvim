if vim.g.vscode then
	return
end

local conditions = {
	hide_in_width = function()
		return vim.o.columns > 100
	end,
}
-- local colors = require "lvim.core.lualine.colors"

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local branch = icons.git.Branch

return {
	messages = {
		require("noice").api.statusline.mode.get,
		cond = require("noice").api.statusline.mode.has,
		-- color = { fg = "#ff9e64" },
	},
	mode = {
		function()
			return " " .. icons.ui.Target .. " "
		end,
		padding = { left = 0, right = 0 },
		color = {},
		cond = nil,
	},
	branch = {
		"b:gitsigns_head",
		icon = branch,
		color = { gui = "bold" },
	},
	filename = {
		"filename",
		path = 1, -- 0: Just the filename
		-- 1: Relative path
		-- 2: Absolute path
		-- 3: Absolute path, with tilde as the home directory
		-- 4: Filename and parent dir, with tilde as the home directory
		unnamed = "", -- Text to show for unnamed buffers.
	},
	diff = {
		"diff",
		source = diff_source,
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		-- diff_color = {
		--   added = { fg = colors.green },
		--   modified = { fg = colors.yellow },
		--   removed = { fg = colors.red },
		-- },
		cond = nil,
	},
	python_env = {
		function()
			local utils = require "lvim.core.lualine.utils"
			if vim.bo.filetype == "python" then
				local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
				if venv then
					local icons = require "nvim-web-devicons"
					local py_icon, _ = icons.get_icon ".py"
					return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
				end
			end
			return ""
		end,
		-- color = { fg = colors.green },
		cond = conditions.hide_in_width,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " ",
			hint = icons.diagnostics.BoldHint .. " ",
		},
		-- cond = conditions.hide_in_width,
	},
	treesitter = {
		function()
			return icons.ui.Tree
		end,
		color = function()
			-- local buf = vim.api.nvim_get_current_buf()
			-- local ts = vim.treesitter.highlighter.active[buf]
			-- return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
		end,
		cond = conditions.hide_in_width,
	},
	lsp = {
		function()
			local buf_clients = vim.lsp.get_clients { bufnr = 0 }
			if #buf_clients == 0 then
				return "LSP Inactive"
			end

			local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			local copilot_active = false

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			-- add formatter
			local formatters = require "lvim.lsp.null-ls.formatters"
			local supported_formatters = formatters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			-- add linter
			local linters = require "lvim.lsp.null-ls.linters"
			local supported_linters = linters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)

			local unique_client_names = table.concat(buf_client_names, ", ")
			local language_servers = string.format("[%s]", unique_client_names)

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
			end

			return language_servers
		end,
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
	},
	location = { "location" },
	progress = {
		"progress",
		fmt = function()
			return "%P/%L"
		end,
		color = {},
	},

	spaces = {
		function()
			local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
			return icons.ui.Tab .. " " .. shiftwidth
		end,
		padding = 1,
	},
	encoding = {
		"o:encoding",
		fmt = string.upper,
		color = {},
		cond = conditions.hide_in_width,
	},
	filetype = { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
	scrollbar = {
		function()
			local current_line = vim.fn.line "."
			local total_lines = vim.fn.line "$"
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 0, right = 0 },
		color = "SLProgress",
		cond = nil,
	},
}
