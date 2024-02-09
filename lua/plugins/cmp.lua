return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		-- "cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp",
		-- "cmp_luasnip",
		"saadparwaiz1/cmp_luasnip",
		-- "cmp-buffer",
		"hrsh7th/cmp-buffer",
		-- "cmp-path",
		"hrsh7th/cmp-path",
		-- "cmp-cmdline",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local conf = {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
			mapping = {
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),

				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				max_width = 0,
				kind_icons = icons.kind,
				source_names = {
					nvim_lsp = "(LSP)",
					emoji = "(Emoji)",
					path = "(Path)",
					calc = "(Calc)",
					cmp_tabnine = "(Tabnine)",
					vsnip = "(Snippet)",
					luasnip = "(Snippet)",
					buffer = "(Buffer)",
				},
				duplicates = {
					buffer = 1,
					path = 1,
					nvim_lsp = 0,
					luasnip = 1,
				},
				duplicates_default = 0,
				format = function(entry, vim_item)
					local max_width = 0
					if max_width ~= 0 and #vim_item.abbr > max_width then
						vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
					end
					vim_item.kind = icons.kind[vim_item.kind]

					if entry.source.name == "copilot" then
						vim_item.kind = icons.git.Octoface
						vim_item.kind_hl_group = "CmpItemKindCopilot"
					end

					-- vim_item.menu = conf.formatting.source_names[entry.source.name]
					-- vim_item.dup = conf.formatting.duplicates[entry.source.name] or conf.formatting.duplicates_default
					vim_item.menu = entry.source.name
					vim_item.dup = 1
					return vim_item
				end,
			},
			sources = {
				{
					name = "nvim_lsp",
					entry_filter = function(entry, ctx)
						local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
						if kind == "Snippet" and ctx.prev_context.filetype == "java" then
							return false
						end
						return true
					end,
				},
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
			},
		}
		cmp.setup(conf)
		local cmdline = {
			{
				type = ":",
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			},
			{
				type = { "/", "?" },
				sources = {
					{ name = "buffer" },
				},
			},
		}
		for _, option in ipairs(cmdline) do
			cmp.setup.cmdline(option.type, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = option.sources,
			})
		end
	end,
}
