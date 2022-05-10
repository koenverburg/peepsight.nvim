local utils = {}

function utils.is_empty_line(buf, line)
  local lines = vim.api.nvim_buf_get_lines(buf, line, line + 1, false)

  if vim.fn.trim(lines[1]) == "" then
    return true
  end

  return false
end

function utils.set_autocmd()
  vim.api.nvim_command [[ autocmd BufWritePost,CursorMoved,CursorMovedI,WinScrolled * :lua require 'peepsight'.run() ]]
end

function utils.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

return utils
