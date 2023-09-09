local M = {}

function M.get_scripts_from_package_json(filter)
  local path = vim.fn.getcwd() .. "/package.json"
  local file_str = require("user.cmd.io").read_file_as_string(path)

  if file_str == nil then
    error(path .. 'not found')
  end

  local scripts = {}

  local decoded_table = vim.json.decode(file_str)
  local scripts_table = decoded_table.scripts or {}

  for k in pairs(scripts_table) do
    if filter == nil or string.match(k, filter) ~= nil then
      table.insert(scripts, k)
    end

  end

  return scripts
end

function M.select_and_run_script()
  local scripts = M.get_scripts_from_package_json()

  table.sort(scripts)

  vim.ui.select(
    scripts,
    {
      prompt = 'Select a Script:',
      format_item = function(item)
        return item
      end,
    },
    function(choice)
      vim.cmd({
        cmd = 'term',
        args = {
          'yarn',
          choice
        }
      })
    end
  )
end

return M
