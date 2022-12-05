local M = {}

function M.setup()
    local colors = require('gruvbox.palette')
    require("bufferline").setup({
        options = {
            numbers = function(opts)
                return string.format('%s', opts.ordinal)
            end,
            show_buffer_close_icons = false,
            show_close_icon = false,
        },
        highlights = {
            fill = {
                bg = colors.dark0_hard,
            },
            background = {
                fg = colors.dark4,
                bg = colors.dark0_hard,
            },
            numbers = {
                bg = colors.dark0_hard,
            },
            modified = {
                bg = colors.dark0_hard,
            },
            separator = {
                fg = colors.dark0,
                bg = colors.dark0_hard,
            },
            indicator_selected = {
                fg = colors.dark0_hard,
            },
        }
    })
end

return M
