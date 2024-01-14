local M = {}

function M.setup()
    require('trouble').setup({
        action_keys = {
            close = {"<esc>", "<leader>x"},
            cancel = {}
        }
    })
end

return M
