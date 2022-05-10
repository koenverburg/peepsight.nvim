local M = {}
local utils = require "peepsight.utils"
local view = require "peepsight.view"
local sight = require "peepsight.sight"

local ns = vim.api.nvim_create_namespace "peepsight"

local defaults = {
  enable = true,
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
  sight.sighting_in(ns, M.queries)
  utils.set_autocmd()
end

function M.disable()
  M.options.enable = false
  view.clear(ns)
end

function M.setup(options, queries)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  M.queries = vim.tbl_deep_extend("force", {}, default_queries, queries or {})

  if M.options.enable then
    M.enable()
  end
end

M.setup()

function M.run()
  if M.options.enable then
    view.clear(ns)
    sight.sighting_in(ns, M.queries)
  end
end

return M
