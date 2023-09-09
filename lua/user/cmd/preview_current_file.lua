local io = require("user.cmd.io")

local M = {}

-- Todo: improve to better search
local function is_oas_file(filePath)
  local fileString = io.read_file_as_string(filePath)

  -- only support OAS 3.x.x
  return string.match(fileString, 'openapi: 3.[%d]+.[%d]+')
end

function M.run()
  local currentFileName = io.get_current_buf_name()

  if io.is_file_ext('md') ~= nil then
    -- this required 'iamcco/markdown-preview.nvim'
    vim.cmd('MarkdownPreview')
  end

  if io.is_file_ext('yaml') ~= nil then
    -- this required 'vinnymeller/swagger-preview.nvim'
    if is_oas_file(currentFileName) ~= nil then
      vim.cmd('SwaggerPreviewToggle')
    end
  end

  -- print("No preview action matched with" .. currentFileName)
end

return M
