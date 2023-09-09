local M = {}

-- read all file content as string
function M.read_file_as_string(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

function M.get_current_file()
  return vim.api.nvim_buf_get_name(0)
end

function M.is_file_ext(type)
  return string.match(M.get_current_file(), "." .. type .. "$")
end

return M
