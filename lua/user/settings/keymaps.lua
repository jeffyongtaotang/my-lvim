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

lvim.keys.normal_mode["<C-m>"] = "<cmd>MarkdownPreview<cr>"
