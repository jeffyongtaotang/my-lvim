lvim.plugins = {
  {
    "lewpoly/sherbet.nvim"
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
  {
    -- Bufferline not working correctly with Telescope-project, use "Cokeline" instead.
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = function()
      require('cokeline').setup()
    end
  },
  {
    'ldelossa/gh.nvim',
    requires = {
      { 'ldelossa/litee.nvim' }
    }
  },
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  },
  { 'towolf/vim-helm' },
  {
    -- Might require some manual step, if ":MarkdownPreview" not working.
    -- ref: https://github.com/iamcco/markdown-preview.nvim/issues/424
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  },
  {
    "simrat39/rust-tools.nvim"
  },
  -- Debugger
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" }
  },
  -- Dependency for cmd folder
  {
    "cuducos/yaml.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }
}

require("user.plugin_cfg.telescope")
require("user.plugin_cfg.cokeline_cfg")
require("user.plugin_cfg.nvimtree")
require("user.plugin_cfg.vgit").init()
require("user.plugin_cfg.startup_dashboard")
require("user.plugin_cfg.treesitter")
require("user.plugin_cfg.gh")
require("user.plugin_cfg.octo_cfg")
require("user.plugin_cfg.trouble_cfg")
require("user.plugin_cfg.dap_vscode_js")
require("user.plugin_cfg.swagger_preview")
require("user.plugin_cfg.rust_tools")

-- plugin enable/disable
lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = false

-- disable bufferline and use cokeline
-- since (https://github.com/akinsho/bufferline.nvim/issues/655)
lvim.builtin.bufferline.active = false
