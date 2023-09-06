require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "/Users/jeff.tong@konghq.com/Coding/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  log_console_level = vim.log.levels.DEBUG -- Logging level for output to console. Set to false to disable console output.
})

local function getConfigEnv(type)

  if type == '2' then
    return "jest.config.integration.js"
  elseif type == '3' then
    return "jest.config.component.js"
  else
    return "jest.config.js"
  end
end

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = function()
        local type = vim.fn.input('Input Test type ([1] unit, [2] integration or [3] component): ')

        return {
          "./node_modules/jest/bin/jest.js",
          "-c" .. "${workspaceFolder}" .. "/" .. getConfigEnv(type),
          "--runInBand",
        }
      end,
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      program = "${file}",
      internalConsoleOptions = "openOnSessionStart",
    }
  }
end
