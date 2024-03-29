local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

keymap.set("n", "te", ":tabedit")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move window
keymap.set("n", "<Leader>h", "<C-w>h")
keymap.set("n", "<Leader>k", "<C-w>k")
keymap.set("n", "<Leader>j", "<C-w>j")
keymap.set("n", "<Leader>l", "<C-w>l")

-- Diagnostics
keymap.set("n", ",d", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", ",p", function()
	vim.diagnostic.goto_prev()
end, opts)

-- I keep messing these up
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Nu", "set nu rnu | se cursorline", {})
