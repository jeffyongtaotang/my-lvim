local rt = require("rust-tools")

local M = {}

rt.setup({
  tools = {
    hover_actions = {
      auto_focus = true,
    }
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<s-k>", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
  },
})

function M.get_which_key()
  return {
    name = "rust tools",
    r = {
      "<cmd>lua require'rust-tools.runnables'.runnables()<cr>",
      "[r]unnables"
    },
    m = {
      "<cmd>lua require'rust-tools.expand_macro'.expand_macro()<cr>",
      "expand [m]acro"
    },
    a = {
      "<cmd>lua require'rust-tools.code_action_group'.code_action_group()<cr>",
      "code [a]ction group"
    },
  }
end

return M
