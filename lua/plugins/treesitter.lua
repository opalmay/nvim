return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = not vim.g.vscode,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				-- disable = { "c", "rust" },
				-- -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				-- disable = function(lang, buf)
				-- 	local max_filesize = 100 * 1024 -- 100 KB
				-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				-- 	if ok and stats and stats.size > max_filesize then
				-- 		return true
				-- 	end
				-- end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,

			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			matchup = { -- andymass/vim-matchup
				enable = true,
			},
			indent = {
				enable = true,
			}
		},
		-- event = { "LazyFile", "VeryLazy" },
		event = "BufRead",
		dependencies = {
			"andymass/vim-matchup",
			-- "JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		opts = {
			opts = {
				-- Defaults
				enable_close = true,      -- Auto close tags
				enable_rename = true,     -- Auto rename pairs of tags
				enable_close_on_slash = false -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			-- per_filetype = {
			-- 	["html"] = {
			-- 		enable_close = false
			-- 	}
			-- }
		}
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			enable_check_bracket_line = true,
			check_ts = true,
			disable_in_macro = true,
		}
	},
	{
		"andersevenrud/nvim_context_vt",
		opts = {
			enabled = false,
		},
		cmd = { "NvimContextVtToggle" },
	}
	--{
	--	"nvim-treesitter/nvim-treesitter-context",
	--	opts = {
	--		enable = true,
	--	},
	--}
}
