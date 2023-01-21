-- detail: (https://github.com/tanvirtin/vgit.nvim#setup)
require('vgit').setup({
  settings = {
    scene = {
      diff_preference = 'split',
    },
  },
})


lvim.builtin.which_key.mappings["g"] = {
  name = "+VGit",
  g = { function() require('vgit').project_diff_preview() end, "Project Diff Preview" },
  f = { function() require('vgit').buffer_diff_preview() end, "Buffer Diff Preview" },
  p = { function() require('vgit').buffer_hunk_preview() end, "Buffer Hunk Preview" },
}
