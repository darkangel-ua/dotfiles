require("bufferline").setup({
   options = {
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
   },
   show_buffer_close_icon = false,
   show_close_icon = false,
   separator_style = 'slant',
})
