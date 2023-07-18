-- LSP Zero Setup
local lsp = require('lsp-zero')

lsp.preset({})
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_sign_icons({
  error = '•',
  warn = '•',
  hint = '•',
  info = '•'
})

lsp.nvim_workspace()
lsp.setup()

-- LSP CMP Setup
local cmp = require('cmp')
local cmp_sel_opt = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim-lsp' },
    { name = 'buffer',  keyword_length = 3 },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace, }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_sel_opt),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_sel_opt),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }
})

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
