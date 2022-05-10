local utils = require "peepsight.utils"

local ts_utils = require "nvim-treesitter.ts_utils"

local M = {}

function M.walk_tree(node, types)
  local expr = node

  while expr do
    if utils.contains(types, expr:type()) then
      return expr
    end
    expr = expr:parent()
  end

  if not expr then return nil end
end


function M.get_function_node(queries)
  local cursor_node = ts_utils.get_node_at_cursor()

  local node = M.walk_tree(cursor_node, queries)

  if not node then
    return nil
  end

  return node
end


return M
