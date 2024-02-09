-- local function attach(opts)
-- 	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions initial_mode=normal<CR>", opts)
-- 	vim.keymap.set("n", "gD", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", opts)
-- 	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references initial_mode=normal<CR>", opts)
-- 	-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)
-- 	-- vim.keymap.set(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	vim.keymap.set("n", "<C-RightMouse>", "<LeftMouse><cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- end

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*",
	callback = function()
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions initial_mode=normal<CR>")
		vim.keymap.set("n", "gD", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>")
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references initial_mode=normal<CR>")
		vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>")
		vim.keymap.set("n", "<C-RightMouse>", "<LeftMouse><cmd>lua vim.diagnostic.open_float()<CR>")
	end,
})

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
									globals = { "vim" },
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
