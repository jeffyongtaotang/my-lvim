local get_hex = require('cokeline/utils').get_hex
local yellow = vim.g.terminal_color_3

require('cokeline').setup({
  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  Explorer',
        fg = yellow,
        bg = get_hex('NvimTreeNormal', 'bg'),
        style = 'bold',
      },
    }
  },
})

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = "<Plug>(cokeline-focus-next)"
lvim.keys.normal_mode["<C-h>"] = "<Plug>(cokeline-focus-prev)"
lvim.keys.normal_mode["<C-c>"] = ":BufferKill<CR>"
