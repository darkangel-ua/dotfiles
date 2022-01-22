local M = {}

function M.setup()
    require('trouble').setup({
        action_keys = {
            close = "<esc>",
            cancel = {}
        }
    })
end

return M
