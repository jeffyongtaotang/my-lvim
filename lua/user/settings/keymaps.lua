lvim.leader = "space"

-- In case to use vim binding to manipulate term histories,
-- use (ctrl+n) to switch to Normal mode in Terminal.
-- With "zsh-vim-mode", use "esc" switch mode and use vim binding
-- for only the cmd line content.
lvim.keys.term_mode["<C-n>"] = "<C-\\><C-n>"

local vgit_which_keys = require("user.plugin_cfg.vgit").get_which_key()
local octo_which_keys = require("user.plugin_cfg.octo_cfg").get_which_key()
local rust_tools_which_keys = require("user.plugin_cfg.rust_tools").get_which_key()

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  g = vgit_which_keys.g,
  f = vgit_which_keys.f,
  p = octo_which_keys.p.l,
  l = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "Dev Tool",
  D = {
    name = "[D]ebugger UI",
    b = {
      "<cmd>lua require'dapui'.float_element('breakpoints', { width = 50, height = 20, enter = true })<cr>",
      "[b]reakpoint UI"
    },
    r = {
      "<cmd>lua require'dapui'.float_element('repl', { width = 50, height = 50, enter = true })<cr>",
      "[r]epl UI"
    },
    w = {
      "<cmd>lua require'dapui'.float_element('watches', { width = 50, height = 20, enter = true })<cr>",
      "[w]atches UI"
    },
    s = {
      "<cmd>lua require'dapui'.float_element('scopes', { width = 50, height = 80, enter = true })<cr>",
      "[s]copes UI"
    },
    S = {
      "<cmd>lua require'dapui'.float_element('stacks', { width = 50, height = 80, enter = true })<cr>",
      "[S]tacks UI"
    },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle [u]I" },
  },
  d = {
    name = "debugger",
    s = { "<cmd>lua require'dap'.session()<cr>", "get [s]ession" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "[d]isconnect" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "add a breakpoin[t]" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "step [b]ack" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "[c]ontinue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to [C]ursor" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "step [i]nto" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "step [o]ver" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "step O[u]t" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "[p]ause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "[q]uit" },
  },
  t = { "<cmd>lua require'dap'.continue()<cr>", "[t]est with debugger" },
  p = {
    "<cmd>lua require'user.cmd.preview_current_file'.run()<cr>", "file [p]review"
  },
  s = {
    "<cmd>lua require'user.cmd.run_package_json_script'.select_and_run_script()<cr>", "run project [s]cript"
  }
}

lvim.builtin.which_key.mappings["r"] = rust_tools_which_keys
lvim.builtin.which_key.mappings["sy"] = {
  "<cmd>lua require'yaml_nvim'.telescope()<cr>", "Search current [y]aml file"
}
