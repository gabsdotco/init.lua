local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.code_actions.eslint,
}

local group = vim.api.nvim_create_augroup("null_ls_format_on_save", { clear = false })
local event = "BufWritePre"
local async = event == "BufWritePost"

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				buffer = bufnr,
				group = group,
			})

			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						async = async,
					})
				end,
			})
		end
	end,
})

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({
		timeout_ms = 2000,
		bufnr = vim.api.nvim_get_current_buf(),
	})

	vim.api.nvim_command("write")
end)
