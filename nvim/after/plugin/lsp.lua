local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local protocol = require("vim.lsp.protocol")

lsp.preset("recommended")

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
  'tsserver',
  'eslint',
})

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
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
    -- format = function(entry, vim_item)
    --   if vim.tbl_contains({ 'path' }, entry.source.name) then
    --     local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
    --     if icon then
    --       vim_item.kind = icon
    --       vim_item.kind_hl_group = hl_group
    --       return vim_item
    --     end
    --   end
    --   return lspkind.cmp_format({ with_text = false })(entry, vim_item)
    -- end
  }
})

local signs = { error = '● ', warn = '● ', info = '● ', hint = '● ' }

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = signs,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>,n", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>,p", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.api.nvim_set_keymap('n', ',d', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
