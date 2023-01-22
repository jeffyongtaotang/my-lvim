require("lspconfig")["yamlls"].setup({
  settings = {
    yaml = {
      schemas = {
        -- kol configuration schema
        ["/Users/jeff.tong@konghq.com/Coding/konnect-on-call-tool-kit/cmd/local-dev/schemas/configuration.schema.yaml"] = "*.kol.config.yaml"
      }
    }
  }
})
