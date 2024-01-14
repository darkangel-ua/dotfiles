local M = {}

function M.setup()
    require('winshift').setup({
        keymaps = {
            disable_defaults = true,
        }
    })
end

return M
