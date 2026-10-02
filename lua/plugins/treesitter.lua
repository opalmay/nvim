return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = not vim.g.vscode,
		branch = "main",
		lazy = false, -- new plugin explicitly does not support lazy-loading
		build = ":TSUpdate",
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		config = function()
			require("nvim-treesitter").setup({
				-- install_dir defaults to stdpath('data')/site; only override if you want
			})

			-- Parsers you want installed. Replaces `ensure_installed`.
			-- This runs async; safe to call on startup.
			require("nvim-treesitter").install({
				"bash",
				"c",
				"css",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			})

			-- Highlight, indent, fold are now opt-in per filetype.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash",
					"c",
					"css",
					"diff",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				callback = function(args)
					-- highlight
					local ok = pcall(vim.treesitter.start, args.buf)
					if not ok then
						return
					end
					-- indent (experimental per upstream, but works fine for most)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					-- folds (uncomment if you want TS-based folding)
					-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					-- vim.wo.foldmethod = "expr"
				end,
			})
		end,
		dependencies = {
			"andymass/vim-matchup",
			-- {
			-- 	"nvim-treesitter/nvim-treesitter-textobjects",
			-- 	branch = "main",
			-- 	config = function()
			-- 		require("nvim-treesitter-textobjects").setup({
			-- 			select = { lookahead = true },
			-- 			move = { set_jumps = true },
			-- 		})
			-- 		-- Wire up your own keymaps; the new plugin does not auto-bind them.
			-- 		-- Example:
			-- 		-- vim.keymap.set({ "x", "o" }, "af",
			-- 		--   function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end)
			-- 	end,
			-- },
		},
	},
	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		opts = {
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			-- per_filetype = {
			-- 	["html"] = {
			-- 		enable_close = false
			-- 	}
			-- }
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			enable_check_bracket_line = true,
			check_ts = true,
			disable_in_macro = true,
		},
	},
	{
		"andersevenrud/nvim_context_vt",
		opts = {
			enabled = false,
		},
		cmd = { "NvimContextVtToggle" },
	},
	--{
	--	"nvim-treesitter/nvim-treesitter-context",
	--	opts = {
	--		enable = true,
	--	},
	--}
}
