local M = {}

function M.get_which_key()
  return {
    name = "+Octo",
    p = {
      name = "Pull Request",
      l = { "<cmd>Octo pr list<CR>", "List Current Project Opened PRs" },
    },
  }
end

return M
