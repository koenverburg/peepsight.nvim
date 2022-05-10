local utils = require "peepsight.utils"
local ts_utils = require "nvim-treesitter.ts_utils"

local ts_helpers = {}

function ts_helpers.walk_tree(node, types)
  local expr = node

  while expr do
    if utils.contains(types, expr:type()) then
      return expr
    end
    expr = expr:parent()
  end

  if not expr then return nil end
end


function ts_helpers.get_node(queries)
  local cursor_node = ts_utils.get_node_at_cursor()

  local node = ts_helpers.walk_tree(cursor_node, queries)

  if not node then
    return nil
  end

  return node
end


return ts_helpers
