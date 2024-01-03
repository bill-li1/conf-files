local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>,f', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', ',f', builtin.git_files, { noremap = true, silent = true })
vim.keymap.set('n', ',r', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', ',gr', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', ',p', builtin.lsp_document_symbols, { noremap = true, silent = true })
vim.keymap.set('n', ',gp', builtin.lsp_dynamic_workspace_symbols, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>,t', ":Telescope resume<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>,d', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
