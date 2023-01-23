local M = {}

function M.init()
  -- detail: (https://github.com/tanvirtin/vgit.nvim#setup)
  require('vgit').setup({
    settings = {
      scene = {
        diff_preference = 'split',
      },
    },
  })
end

function M.get_which_key()
  return {
    name = "+VGit",
    g = { function() require('vgit').project_diff_preview() end, "Project Diff Preview" },
    f = { function() require('vgit').buffer_diff_preview() end, "Buffer Diff Preview" },
  }
end

return M
