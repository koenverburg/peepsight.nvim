local M = {}

local function greeting()
  print('Hello world!!')
end

function M.setup(opts)
  if opts.enable then
    greeting()
  end
end

return M
