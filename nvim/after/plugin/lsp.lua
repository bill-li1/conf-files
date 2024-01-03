local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local protocol = require("vim.lsp.protocol")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

lsp.ensure_installed({
  'eslint',
  'tsserver'
})

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<cr>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup {
  window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
      border = nil,
      scrollbar = '',
      -- other options
    },
  },
  -- other options
}

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  }
})

local signs = { error = '●', warn = '●', info = '●', hint = '●' }

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = signs,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", ",d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>,n", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>,p", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
