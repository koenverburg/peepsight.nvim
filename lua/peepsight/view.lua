local view = {}

function view.dim(namespace, buffer, line_number)
  pcall(vim.api.nvim_buf_set_extmark, buffer, namespace, line_number, 0, {
    end_line = line_number + 1,
    end_col = 0,
    hl_group = "Comment", -- mvp
    hl_eol = true,
    priority = 10000,
  })
end

function view.clear(namespace)
  vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
end

return view
