local M = {}
local navic = require('nvim-navic')

function M.setup()
    navic.setup({})
end

M.attach = navic.attach

return M
