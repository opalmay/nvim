return {
	'nanozuki/tabby.nvim',
	cond = not vim.g.vscode,
	event = 'VimEnter',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('tabby.tabline').use_preset('tab_only', {
			theme = {
				fill = 'TabLineFill',   -- tabline background
				head = 'TabLine',       -- head element highlight
				current_tab = 'TabLineSel', -- current tab label highlight
				tab = 'TabLine',        -- other tab label highlight
				win = 'TabLine',        -- window highlight
				tail = 'TabLine',       -- tail element highlight
			},
			-- tab_name = {
			-- 	name_fallback = function(tabid)
			-- 		return tabid
			-- 	end,
			-- },
			buf_name = {
				mode = "relative",
			},
		})
	end,
}
