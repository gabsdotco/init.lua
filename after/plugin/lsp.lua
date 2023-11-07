local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

local lua_opts = lsp_zero.nvim_lua_ls()

lsp_config.lua_ls.setup(lua_opts)

-- Setup LSP Preferences
lsp_zero.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
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

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-e>"] = cmp.mapping.complete(),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
  })
})

-- LSP Remaps
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp_zero.default_keymaps({ buffer = bufnr })

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end)

mason.setup({})
mason_lsp.setup({
  ensure_installed = {
    'tsserver',
    'lua_ls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

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
lsp_zero.setup()
