local M = {}

function M.get_which_key()
  return {
    name = "+Octo",
    p = {
      name = "List Current Project PRs",
      c = { "<cmd>Octo pr list states=CLOSED<CR>", "List Current Project Closed PRs" },
      o = { "<cmd>Octo pr list<CR>", "List Current Project Opened PRs" },
    }
  }
end

return M
