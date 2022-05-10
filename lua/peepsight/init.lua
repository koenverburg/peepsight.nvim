local M = {}
local utils = require "peepsight.utils"
local view = require "peepsight.view"
local sight = require "peepsight.sight"

local ns = vim.api.nvim_create_namespace "peepsight"

local defaults = {
  enable = true
}

function M.enable()
  sight.sighting_in(ns)
  utils.set_autocmd()
end


function M.disable()
  M.options.enable = false
  view.clear(ns)
end

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})

  if M.options.enable then
    M.enable()
  end
end

function M.run()
  if M.options.enable then
    view.clear(ns)
    sight.sighting_in(ns)
  end
end

return M
