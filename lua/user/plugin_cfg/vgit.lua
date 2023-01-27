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
    g = { function() require('vgit').project_diff_preview() end, "Project Diff" },
    f = { function() require('vgit').buffer_history_preview() end, "File History Diff" },
  }
end

return M
