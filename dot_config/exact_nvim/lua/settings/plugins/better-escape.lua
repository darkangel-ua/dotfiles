local M = {}

function M.setup()
    require('better_escape').setup{
        mapping = { "jk", "kj" },
        timeout = 100,
    }
end

return M
