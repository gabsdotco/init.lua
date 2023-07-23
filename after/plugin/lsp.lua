local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'lua_ls',
})

-- Fix "Undefined global 'vim'" Warning
lsp.nvim_workspace()

-- Setup LSP Preferences
lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    -- error = '•',
    -- warn = '•',
    -- hint = '•',
    -- info = '•'
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

-- Setup CMP Plugin
local cmp = require('cmp')
local cmp_select = {
  behavior = cmp.SelectBehavior.Select,
}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

-- LSP Remaps
lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end)

-- LSP Diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

-- LSP Diagnostic Remaps
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {}) -- Open line diagnostics popup

-- LSP Setup
lsp.setup()
