lvim.autocommands = {
  {
    "BufRead",
    {
      pattern = { "Tiltfile" },
      command = "setf tiltfile",
    },
  },
}
