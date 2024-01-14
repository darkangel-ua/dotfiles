local M = {}

function M.setup()
    require('FTerm').setup({
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    })
end

return M
