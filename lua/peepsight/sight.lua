local utils = require 'peepsight.utils'
local view = require 'peepsight.view'
local ts_helpers = require 'peepsight.treesitter-helpers'

local sight = {}

function sight.sighting_in(ns)
  local end_of_file = vim.fn.line('$')

  local node = ts_helpers.get_function_node({
    -- go
    "function_declaration",
    "method_declaration",
    "func_literal",

    -- typescript
    "arrow_function",
    "function_declaration",
    "generator_function_declaration",
  })

  if not node then
    return
  end

  -- Dim above function range
  for i = 0, node:start()-1 do
    if not utils.is_empty_line(0, i) then
      view.dim(ns, 0, i)
    end
  end

  -- Dim below function range
  for j = node:end_()+1, end_of_file do
    if not utils.is_empty_line(0, j) then
      view.dim(ns, 0, j)
    end
  end
end



return sight
