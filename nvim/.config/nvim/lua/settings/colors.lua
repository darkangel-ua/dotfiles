local lush = require('lush')
local base = require('gruvbox.base')
local my_colors = lush.extends({require('gruvbox')}).with(function()
    return {
        TelescopePreviewLine { bg = base.GruvboxBlue.fg.hex, fg = base.GruvboxBg1.fg.hex, gui = "bold" },
    }
end)

-- here is where color scheme applied
lush(my_colors, { force_clear = false })
