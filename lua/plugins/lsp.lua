-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gD", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", { buffer = bufnr })
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<C-RightMouse>", "<LeftMouse><cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
	end,
})

local diagnostic_config = {
	signs = {
		values = {
			{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
			{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
			{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
			{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
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
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
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
			},
			automatic_installation = true,
		})

		-- After setting up mason-lspconfig you may set up servers via lspconfig
		-- require("lspconfig").lua_ls.setup {}
		-- require("lspconfig").rust_analyzer.setup {}
		-- ...
	end,
}
