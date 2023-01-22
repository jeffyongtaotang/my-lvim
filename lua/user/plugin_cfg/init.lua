lvim.plugins = {
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').load()
    end
  },
  { "tanvirtin/vgit.nvim" },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup()
    end
  },
}

require("user.plugin_cfg.telescope")
require("user.plugin_cfg.bufferline")
require("user.plugin_cfg.nvimtree")
require("user.plugin_cfg.vgit")
require("user.plugin_cfg.startup_dashboard")
require("user.plugin_cfg.treesitter")

-- plugin enable/disable
lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = false
