local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "lua_ls" },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        handlers = handlers,
      })
    end,
  },
})
