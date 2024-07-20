local M = {}

function M.setup()
    require('trouble').setup({
        focus = true,
        warn_no_results = false,
        open_no_results = true,
        keys = {
            ['<esc>'] = 'close',
        },
    })
end

return M
