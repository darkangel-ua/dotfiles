local M = {}

function M.setup()
    local colors = require('gruvbox.palette')
    require("gruvbox").setup({
        contrast = "hard",
        overrides = {
            BufferLineFill = { bg = colors.dark0_hard },
            BufferLineSeparator = { fg = colors.dark0 },
            BufferLineIndicatorSelected = { fg = colors.dark0_hard },
            LuasnipInsertNodePassive = { fg = colors.bright_blue, bg = colors.dark1, italic = true },
            LuasnipChoiceNodePassive = { fg = colors.bright_blue, bg = colors.dark1, italic = true },
            LuasnipExitNodePassive = { fg = colors.bright_red, bg = colors.dark1, italic = true },
            HopNextKey = { link = "GruvboxOrangeBold" },
            HopNextKey1 = { link = "GruvboxOrangeBold" },
            HopNextKey2 = { link = "GruvboxOrange" },
            Pmenu = { bg = colors.dark1 },
        },
    })

    vim.cmd [[ colorscheme gruvbox ]]
end

return M
