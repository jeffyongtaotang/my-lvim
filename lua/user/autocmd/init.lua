lvim.autocommands = {
  {
    "BufRead",
    {
      pattern = { "Tiltfile" },
      command = "setf tiltfile",
    }
  },
  {
    -- Unfold all code blocks by default
    -- ref: https://www.jmaguire.tech/posts/treesitter_folding/
    "BufReadPost, FileReadPost",
    {
      pattern = "*",
      command = "normal zR",
    }
  },
}
