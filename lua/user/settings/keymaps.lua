-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

local vgit_which_keys = require("user.plugin_cfg.vgit").get_which_key()

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  g = vgit_which_keys.g,
  f = vgit_which_keys.f,
}
