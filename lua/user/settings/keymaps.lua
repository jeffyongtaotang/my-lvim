lvim.leader = "space"

-- In case to use vim binding to manipulate term histories,
-- use (ctrl+n) to switch to Normal mode in Terminal.
-- With "zsh-vim-mode", use "esc" switch mode and use vim binding
-- for only the cmd line content.
lvim.keys.term_mode["<C-n>"] = "<C-\\><C-n>"

local vgit_which_keys = require("user.plugin_cfg.vgit").get_which_key()
local octo_which_keys = require("user.plugin_cfg.octo_cfg").get_which_key()

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  g = vgit_which_keys.g,
  f = vgit_which_keys.f,
  p = octo_which_keys.p.l,
  l = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
}

-- remap the debugger menu
lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  -- r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  w = {
    name = 'other UI windows',
    b = {
      "<cmd>lua require'dapui'.float_element('breakpoints', { width = 50, height = 20, enter = true })<cr>",
      "Toggle Breakpoint UI"
    },
    r = {
      "<cmd>lua require'dapui'.float_element('repl', { width = 50, height = 50, enter = true })<cr>",
      "Toggle REPL UI"
    },
    w = {
      "<cmd>lua require'dapui'.float_element('watches', { width = 50, height = 20, enter = true })<cr>",
      "Toggle Watches UI"
    },
    s = {
      "<cmd>lua require'dapui'.float_element('scopes', { width = 50, height = 80, enter = true })<cr>",
      "Toggle Scopes UI"
    },
    S = {
      "<cmd>lua require'dapui'.float_element('stacks', { width = 50, height = 80, enter = true })<cr>",
      "Toggle Stacks UI"
    },
  }
}

lvim.builtin.which_key.mappings["m"] = {
  "<cmd>MarkdownPreview<cr>", "Preview a Markdown File"
}
