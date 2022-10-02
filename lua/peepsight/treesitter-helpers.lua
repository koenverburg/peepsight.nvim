local utils = require "peepsight.utils"
local ts_utils = require "nvim-treesitter.ts_utils"

local ts_helpers = {}

function ts_helpers.walk_tree(node, types)
  local expr = node

  while expr do
    if utils.contains(types, expr:type()) then
      return expr
    end

    if expr:parent() == nil then
      return
    end
    expr = expr:parent()
  end

  if not expr then
    return nil
  end
end

local prev_node = nil
function ts_helpers.get_node_from_query(queries)
  local cursor_node = ts_utils.get_node_at_cursor()

  if not cursor_node then
    return nil
  end

  if cursor_node:type() == "document" then
    return prev_node
  end

  local node = ts_helpers.walk_tree(cursor_node, queries)

  if not node then
    return nil
  end

  prev_node = node

  return node
end

return ts_helpers
