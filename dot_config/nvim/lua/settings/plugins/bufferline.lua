local M = {}

function M.setup()
    local colors = require('gruvbox.palette').get_base_colors(nil, "hard")
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
                bg = colors.bg0,
            },
            background = {
                fg = colors.bg4,
                bg = colors.bg0,
            },
            numbers = {
                bg = colors.bg0,
            },
            modified = {
                bg = colors.bg0,
            },
            separator = {
                bg = colors.bg0,
            },
            indicator_selected = {
                fg = colors.bg0,
            },
        }
    })
end

return M
