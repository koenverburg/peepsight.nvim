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

function utils.dim(namespace, buffer, line_number)
  pcall(vim.api.nvim_buf_set_extmark, buffer, namespace, line_number, 0, {
    end_line = line_number + 1,
    end_col = 0,
    hl_group = "Comment", -- mvp
    hl_eol = true,
    priority = 10000,
  })
end

function utils.clear(namespace)
  vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
end

return utils
