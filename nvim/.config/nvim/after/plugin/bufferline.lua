require("bufferline").setup({
    options = {
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
    },
})
