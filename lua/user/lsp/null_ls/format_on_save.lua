-- hacky
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local ok, null_ls = pcall(require, "null-ls")
if ok then
  ---@diagnostic disable-next-line: redundant-parameter
  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
          end,
        })
      end
    end,
  })
end
