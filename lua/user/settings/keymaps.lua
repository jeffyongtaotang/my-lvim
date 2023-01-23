-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Change to nornal mode from ternminal mode
lvim.keys.term_mode["<esc>"] = "<C-\\><C-n>"

local vgit_which_keys = require("user.plugin_cfg.vgit").get_which_key()
local octo_which_keys = require("user.plugin_cfg.octo_cfg").get_which_key()

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  g = vgit_which_keys.g,
  f = vgit_which_keys.f,
  p = octo_which_keys.p,
}
