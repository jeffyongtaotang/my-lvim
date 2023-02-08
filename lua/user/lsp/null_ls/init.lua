require("user.lsp.null_ls.format_on_save")

-- requires "eslint_d" (https://www.npmjs.com/package/eslint_d)
-- since it's faster on format-on-save
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
  {
    command = "cspell",
    filetypes = { "markdown" },
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity["HINT"]
    end
  }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
  },
  {
    command = "cspell",
    filetypes = { "markdown" },
  }
}
