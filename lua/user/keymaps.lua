vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<ESC>", "<CMD>noh<CR><ESC>")
map("n", "<leader>q", "<CMD>confirm q<CR>")

map("n", "<C-s>", "<CMD>w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>")

map("i", "<C-c>", "<ESC>")
map("n", "<C-c>", "yy")

map("v", "@", ":normal @")
map("n", "<M-r>", ":silent only | Jaq<cr>")

map("n", "<C-S-q>", "<cmd>tabclose<CR>")
-- open current buffer in new tab
map("n", "<C-S-n>", "<cmd>tabnew %<CR>")
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

map("n", "0", "^")
map("v", "0", "^")
map("x", "0", "^")
map("n", "^", "0")
map("v", "^", "0")
map("x", "^", "0")

map("n", "<C-c>", '"+yy')
map("v", "<C-c>", '"+y')
map("x", "<C-c>", '"+y')

map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "K", ":move '<-2<CR>gv=gv")
