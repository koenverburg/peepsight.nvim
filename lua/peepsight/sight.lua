local utils = require "peepsight.utils"
local ts_helpers = require "peepsight.treesitter-helpers"

local sight = {}

function sight.focus(ns, queries)
  local end_of_file = vim.fn.line "$"

  local node = ts_helpers.get_node_from_query(queries)

  if not node then
    return
  end

  -- Dim above function range
  for i = 0, node:start() - 1 do
    if not utils.is_empty_line(0, i) then
      utils.dim(ns, 0, i)
    end
  end

  -- Dim below function range
  for j = node:end_() + 1, end_of_file do
    if not utils.is_empty_line(0, j) then
      utils.dim(ns, 0, j)
    end
  end
end

return sight
