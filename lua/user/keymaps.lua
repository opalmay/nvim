vim.g.mapleader = " "
local map = vim.keymap.set

-- map("n", "<c-g>", "ggVGg<c-g><esc>")

map("n", "<ESC>", "<CMD>noh<CR><ESC>")
map("n", "<leader>q", "<CMD>confirm q<CR>")
map("n", "<C-q>", "<CMD>confirm q<CR>")

-- map("n", "0", "^")
-- map("v", "0", "^")
-- map("x", "0", "^")
-- map("n", "^", "0")
-- map("v", "^", "0")
-- map("x", "^", "0")
--
map("n", "<C-c>", '"+yy')
map("v", "<C-c>", '"+y')
map("x", "<C-c>", '"+y')

map("n", "j", "j<cmd>noh<CR>")
map("n", "k", "k<cmd>noh<CR>")

if vim.g.vscode then
	return
end

map("n", "<C-s>", "<CMD>w<CR>")
map("i", "<C-s>", "<ESC><CMD>w<CR>")

map("i", "<C-c>", "<ESC>")
map("n", "<C-c>", "yy")

map("v", "@", ":normal @")

map("n", "<C-S-q>", "<cmd>tabclose<CR>")
-- open current buffer in new tab
-- map("n", "<C-S-n>", "<cmd>tabnew %<CR>")
map("n", "<C-S-n>", "<cmd>tabnew<CR>")
-- open current window in new tab
map("n", "<C-S-t>", "<C-w>T")
-- harpoon like
map("n", "<C-S-J>", "<cmd>tabn 1<CR>")
map("n", "<C-S-K>", "<cmd>tabn 2<CR>")
map("n", "<C-S-l>", "<cmd>tabn 3<CR>")
map("n", "<C-S-;>", "<cmd>tabn 4<CR>")

map("v", "<RightMouse>", '"+y')

map("n", "<Left>", "<C-w>h")
map("n", "<Down>", "<C-w>j")
map("n", "<Up>", "<C-w>k")
map("n", "<Right>", "<C-w>l")

map("n", "<leader>ra", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


map("x", "J", "<cmd>move '>+1<CR>gv=gv<CR>")
map("x", "K", "<cmd>move '<-2<CR>gv=gv<CR>")

map("n", "<c-k>", "<cmd>cprev<CR>")
map("n", "<c-j>", "<cmd>cnext<CR>")

-- map("n", "gcc", "magcc`a", { noremap = false, silent = true, remap = true})
-- map("n", "gcA", "oa<ESC>gccv$hdk$p")
-- map("n", "gcA", "oa<ESC>gcc")


-- vim.keymap.set('n', 'gcc', function()
--   vim.cmd('normal! ma')  -- Set mark 'a'
--   vim.cmd('normal! gcc') -- This assumes 'gcc' toggles comments; adjust as needed
--   vim.cmd('normal! `a')  -- Return to mark 'a'
-- end, {noremap = true, silent = true})
--vim.keymap.set("n", "gcc", "<cmd>norm! ma<CR><cmd>norm! gcc<CR><cmd>norm! `a<CR>")

map("t", "<C-h>", "<Left>")
map("t", "<Left>", "<C-\\><C-N><C-w>h")

map("n", "gcu", function()
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	col = col + 1 -- 1-based, to match string.find

	local target, init = nil, 1
	while true do
		local s, e, inner = line:find("<!%-%-%s?(.-)%s?%-%->", init)
		if not s then break end
		target = target or { s = s, e = e, inner = inner }
		if col >= s and col <= e then
			target = { s = s, e = e, inner = inner }
			break
		end
		init = e + 1
	end

	if not target then return end
	vim.api.nvim_set_current_line(line:sub(1, target.s - 1) .. target.inner .. line:sub(target.e + 1))
	vim.api.nvim_win_set_cursor(0, { row, target.s - 1 })
end, { buffer = true, desc = "Uncomment inline HTML comment" })



local MASTER = vim.fn.expand("~/Projects/WhereJob/jobpipe/private/master_cv.md")

local function master_bullets()
  local items, in_exp = {}, false
  for line in io.lines(MASTER) do
    if line:match("^##%s.*Experience") then in_exp = true end
    local id, text = line:match("^%- %[(%d+)%]%s*(.+)$")
    if in_exp and id then
      text = text:gsub("—", "-"):gsub("–", "-")
      table.insert(items, { id = id, text = "- " .. text })
    end
  end
  return items
end

local function pick_bullet()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "Master CV bullet",
    finder = finders.new_table({
      results = master_bullets(),
      entry_maker = function(it)
        local display = "[" .. it.id .. "] " .. it.text:sub(3)
        return { value = it, display = display, ordinal = display }
      end,
    }),
    sorter = conf.generic_sorter({}),
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry)
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { entry.value.text })
        vim.bo[self.state.bufnr].filetype = "markdown"
        vim.wo[self.state.winid].wrap = true
      end,
    }),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if entry then vim.api.nvim_put({ entry.value.text }, "l", true, true) end
      end)
      return true
    end,
  }):find()
end

vim.keymap.set("n", "<leader>m", pick_bullet, { desc = "Insert master CV bullet" })
