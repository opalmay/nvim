-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		-- local client = vim.lsp.get_client_by_id(args.data.client_id)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gD", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<C-RightMouse>", "<LeftMouse><cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
		-- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<leader>rn", ":IncRename ", { buffer = bufnr })

		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
		vim.keymap.set("n", "<M-f>", "<cmd>Format<cr>", { buffer = bufnr })
		-- if client.server_capabilities.inlayHintProvider then
		-- 	vim.lsp.buf.inlay_hint(bufnr, true)
		-- end
	end,
})

local diagnostic_config = {
	signs = {
		values = {
			{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
			{ name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
			{ name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
			{ name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
		},
	},
	virtual_text = false,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.diagnostic.config(diagnostic_config)
for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

return {
	-- { -- disgnostics float
	-- 	"RaafatTurki/corn.nvim",
	-- 	opts = {
	-- 		border_style = "rounded",
	-- 		icons = {
	-- 			error = icons.diagnostics.Error,
	-- 			warn = icons.diagnostics.Warning,
	-- 			info = icons.diagnostics.Information,
	-- 			hint = icons.diagnostics.Hint,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"TheLeoP/powershell.nvim",
	-- 	-- "opalmay/powershell.nvim",
	-- 	cond = vim.fn.has("linux") == 1,
	-- 	opts = {
	-- 		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
	-- 		shell = "pwsh",
	-- 		settings = {
	-- 			powershell = {
	-- 				codeFormatting = {
	-- 					openBraceOnSameLine = true,
	-- 					whitespaceBetweenParameters = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	ft = "ps1",
	-- 	keys = {
	-- 		{
	-- 			"<leader>E",
	-- 			function()
	-- 				require("powershell").eval()
	-- 			end,
	-- 			mode = { "n", "v" },
	-- 		},
	-- 		{
	-- 			"<leader>T",
	-- 			function()
	-- 				require("powershell").toggle_term()
	-- 			end,
	-- 		},
	-- 	},
	-- },
	{
		"soulis-1256/eagle.nvim",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		cond = not vim.g.vscode,
		opts = {},
		ft = "lua",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = not vim.g.vscode,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"powershell_es",
					"yamlls",
					"lemminx",
					"jsonls",
					"bashls",
				},
				handlers = {
					-- The first entry (without a key) will be the default handler
					-- and will be called for each installed server that doesn't have
					-- a dedicated handler.
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({})
					end,
					-- Next, you can provide targeted overrides for specific servers.
					-- ["rust_analyzer"] = function()
					-- 	require("rust-tools").setup({})
					-- end,
					["ruff_lsp"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.ruff_lsp.setup({
							init_options = {
								settings = {
									-- Any extra CLI arguments for `ruff` go here.
									format = {
										args = {
											"--line-length=150"
										}
									},
									args = {},
								},
							},
						})
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "icons" },
									},
								},
							},
						})
					end,
					["powershell_es"] = function()
						-- if vim.fn.has("linux") == 1 then
						-- 	return
						-- end
						local lspconfig = require("lspconfig")
						lspconfig.powershell_es.setup({
							settings = {
								powershell = {
									codeFormatting = {
										openBraceOnSameLine = true,
										whitespaceBetweenParameters = true,
									},
								},
							},
						})
					end,
					["basedpyright"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.basedpyright.setup({
							settings = {
								python = {
									analysis = {
										typeCheckingMode = "off",
										useLibraryCodeForTypes = false,
									},
								},
							},
						})
					end,
				},
				automatic_installation = true,
			})
		end,
	},
}
