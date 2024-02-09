local map = vim.keymap.set

map("n", "<ESC>", "<CMD>noh<CR><ESC>")

map("n", "<C-s>", "<CMD>w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>")
