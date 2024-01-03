local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    border = 'rounded',
  },
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    enable = false
  },
  outline = {
    layout = 'float'
  },
  beacon = {
    enable = false
  }
})

---@diagnostic disable-next-line: unused-local
local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>,n", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<leader>,p", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)

-- code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
