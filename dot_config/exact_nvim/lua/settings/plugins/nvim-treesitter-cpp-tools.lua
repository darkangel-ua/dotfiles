local M = {}

function M.setup()
    require('nt-cpp-tools').setup({
        preview = {
            quit = 'q', -- optional keymapping for quit preview
            accept = 'i' -- optional keymapping for accept preview
        },
    })
end

return M
