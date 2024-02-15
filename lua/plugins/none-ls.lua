return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	opts = {
		ensure_installed = {
			-- Opt to list sources here, when available in mason.
		},
		automatic_installation = false,
		handlers = {},
	},
}
