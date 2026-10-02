return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  cond = not vim.g.vscode,
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<C-k>"]  = { "select_prev", "fallback" },
      ["<C-j>"]  = { "select_next", "fallback" },
      ["<Up>"]   = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-d>"]  = { "scroll_documentation_up", "fallback" },
      ["<C-f>"]  = { "scroll_documentation_down", "fallback" },
      ["<C-e>"]  = { "hide", "fallback" },
      ["<CR>"]   = { "accept", "fallback" },
    },

		snippets = { preset = "default" },  -- uses vim.snippet, loads friendly-snippets

    completion = {
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = false },
    },

    signature = { window = { border = "rounded" } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- equivalent of your group_index = 0 priority boost
        },
        lsp = {
          -- your Java "drop LSP snippets" rule
          -- transform_items = function(ctx, items)
          --   if vim.bo[ctx.bufnr or 0].filetype ~= "java" then
          --     return items
          --   end
          --   local CIK = require("blink.cmp.types").CompletionItemKind
          --   return vim.tbl_filter(function(item)
          --     return item.kind ~= CIK.Snippet
          --   end, items)
          -- end,
        },
      },
    },

    cmdline = {
      enabled = true,
      keymap = { preset = "inherit" },
      sources = function()
        local t = vim.fn.getcmdtype()
        if t == ":" then return { "path", "cmdline" } end
        if t == "/" or t == "?" then return { "buffer" } end
        return {}
      end,
      completion = {
        menu = { auto_show = true },
        list = { selection = { preselect = false } },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    -- if you had a custom icons.kind table, drop it in here:
    -- appearance = { kind_icons = icons.kind },
  },
}
