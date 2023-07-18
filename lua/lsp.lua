-- LSP Zero Setup
local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})

lsp.set_sign_icons({
  error = '•',
  warn = '•',
  hint = '•',
  info = '•'
})

lsp.nvim_workspace()
lsp.setup()

-- Neovim LSP Diagnostics
vim.diagnostic.config({
  virtual_text = true,
})

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

-- LSP CMP Setup
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})
