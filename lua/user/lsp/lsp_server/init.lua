require("lspconfig")["yamlls"].setup({
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
