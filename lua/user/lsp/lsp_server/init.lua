require("user.lsp.lsp_server.helm_ls")

require("lspconfig")["yamlls"].setup({
  on_attach = function(_, bufnr)
    -- In case to let "helm_ls" works correctly, disable yamlls for helm file type
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable()
    end
  end,
  settings = {
    yaml = {
      schemas = {
        -- kol configuration schema
        ["/Users/jeff.tong@konghq.com/Coding/konnect-on-call-tool-kit/cmd/local-dev/schemas/configuration.schema.yaml"] = "*.kol.config.yaml",
        ["http://json-schema.org/draft-07/schema"] = "/cmd/local-dev/**/*.schema.yaml",
      }
    }
  }
})

-- Use python syntax highline for Tiltfile
require("nvim-treesitter.parsers").filetype_to_parsername.tiltfile = "python"

require("lspconfig")["tilt_ls"].setup({
  cmd = { "tilt", "lsp", "start" },
  filetypes = { "tiltfile" }
})

require("lspconfig")["helm_ls"].setup({
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
})
