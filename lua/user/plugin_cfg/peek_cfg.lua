local M = {}

function M.init()
  -- default config:
  require('peek').setup({
    auto_load = true, -- whether to automatically load preview when
    -- entering another markdown buffer
    close_on_bdelete = true, -- close preview window on buffer delete

    syntax = true, -- enable syntax highlighting, affects performance

    theme = 'dark', -- 'dark' or 'light'

    update_on_change = true,

    -- relevant if update_on_change is true
    throttle_at = 200000, -- start throttling when file exceeds this
    -- amount of bytes in size
    throttle_time = 'auto', -- minimum amount of time in milliseconds
    -- that has to pass before starting new render
  })
end

function M.get_which_key()
  return {
    name = "+Markdown",
    o = { require("peek").open, "Open Preview" },
    c = { require("peek").close, "Close Preview" },
  }
end

return M
