-- From https://github.com/startup-nvim/startup.nvim/blob/master/lua/startup/themes/dashboard.lua
local settings = {
  -- every line should be same width without escaped \
  graph = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    margin = 0,
    content = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣄⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⣿⣿⣶⣄⠹⣿⣿⣿⡟⠁⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⡆⢹⣿⣿⣿⣷⡀⠀",
      "⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⡇⠀",
      "⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⠟⠁⠀",
      "⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠹⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀",
      "⠀ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀",
      "⠀⠀⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⢿⣿⣿⣿⣿⡄⠀⠀⠀⠀",
      "⠀⢀⣿⣿⣿⣿⣿⡟⢀⣿⣿⣿⣿⣿⣿⡿⠟⢁⡄⠸⣿⣿⣿⣿⣷⠀⠀⠀ ",
      "⠀ ⣼⣿⣿⣿⣿⠏⠀⣈⡙⠛⢛⠋⠉⠁⠀⣸⣿⣿⠀⢻⣿⣿⣿⣿⡆⠀⠀",
      "⠀⢠⣿⣿⣿⣿⣟⠀⠀⢿⣿⣿⣿⡄⠀⠀⢀⣿⣿⡟⠃⣸⣿⣿⣿⣿⡇⠀⠀",
      "⠀⠘⠛⠛⠛⠛⠛⠛⠀⠘⠛⠛⠛⠛⠓⠀⠛⠛⠛⠃⠘⠛⠛⠛⠛⠛⠃⠀⠀",
    },
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    margin = 0,
    content = {
      { " [P]roject", "lua require('telescope').extensions.project.project { display_type = 'full' }", "P" },
      { " Find [F]ile", "Telescope find_files", "F" },
      { " Find [W]ord", "Telescope live_grep", "W" },
      { " [R]ecent Files", "Telescope oldfiles", "R" },
      { " [N]ew File", "lua require'startup'.new_file()", "N" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = { "graph", "body" },
}

require("startup").setup(settings)
