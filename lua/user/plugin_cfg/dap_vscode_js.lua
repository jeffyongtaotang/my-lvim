-- TODO:
-- Below been set to the lvim core,
-- since we have no way to override it correctly,
-- unless we disable the builtin DAP and reinstall
-- it in our own way.
--
-- lvim.builtin.dap.ui.layouts = {
--   {
--     elements = {
--       { id = "console", size = 1 },
--     },
--     size = 0.2,
--     position = "right",
--   },
-- }

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "/Users/jeff.tong@konghq.com/Coding/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  log_console_level = vim.log.levels.DEBUG -- Logging level for output to console. Set to false to disable console output.
})

-- -- retrieve /test:.*/ scripts from package.json
-- local function get_all_test_env_from_package_json()
--   local path = vim.fn.getcwd() .. "/package.json"
--   local file_str = require("user.cmd.io").read_file_as_string(path)

--   if file_str == nil then
--     error(path .. 'not found')
--   end

--   local envs = {}

--   local decoded_table = vim.json.decode(file_str)
--   local scripts = decoded_table.scripts or {}

--   for k in pairs(scripts) do
--     if string.match(k, "^test:[^.]+") then
--       table.insert(envs, k)
--     end
--   end

--   return envs
-- end

-- prompt user a selection of test env
local function select_test_env(envs)
  local type

  table.sort(envs)

  vim.ui.select(
    envs,
    {
      prompt = 'Select Test Cmds:',
      format_item = function(item)
        return item
      end,
    },
    function(choice)
      type = choice
    end
  )

  return type
end

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "yarn",
      runtimeArgs = function()
        local test_cmds = require("user.cmd.run_package_json_script").get_scripts_from_package_json("^test:[^.]+")

        return {
          "--cwd",
          "${workspaceFolder}",
          select_test_env(test_cmds)
        }
      end,
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      program = "${file}",
      internalConsoleOptions = "neverOpen",
    }
  }
end
