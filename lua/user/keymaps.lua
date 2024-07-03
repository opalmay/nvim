vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<ESC>", "<CMD>noh<CR><ESC>")
map("n", "<leader>q", "<CMD>confirm q<CR>")

map("n", "0", "^")
map("v", "0", "^")
map("x", "0", "^")
map("n", "^", "0")
map("v", "^", "0")
map("x", "^", "0")

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
