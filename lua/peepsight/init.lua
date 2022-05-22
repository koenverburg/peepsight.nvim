local M = {}
local utils = require "peepsight.utils"
local view = require "peepsight.view"
local sight = require "peepsight.sight"

local ns = vim.api.nvim_create_namespace "peepsight"

local defaults = {
  enable = false,
}

local default_queries = {
  -- go
  "function_declaration",
  "method_declaration",
  "func_literal",

  -- typescript
  "arrow_function",
  "function_declaration",
  "generator_function_declaration",
}

function M.enable()
  M.options.enable = true
  sight.sighting_in(ns, M.queries)
  utils.set_autocmd()
end

function M.disable()
  M.options.enable = false
  view.clear(ns)
end


function M.setup(queries)
  M.options = vim.tbl_deep_extend("force", {}, defaults, {})
  M.queries = vim.tbl_deep_extend("force", {}, default_queries, queries or {})

  if M.options.enable then
    M.enable()
  end
end

function M.run()
  if M.options.enable then
    view.clear(ns)
    sight.sighting_in(ns, M.queries)
  end
end

function M.toggle()
  if M.options.enable then
    M.disable()
  else
    M.enable()
  end
end

return M
