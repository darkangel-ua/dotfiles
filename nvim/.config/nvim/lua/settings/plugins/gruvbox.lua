local M = {}

function M.setup()
    local colors = require('gruvbox.palette')
    require("gruvbox").setup({
        contrast = "hard",
        overrides = {
            -- make sign column same as background
            SignColumn = { bg = colors.dark0_hard },
            GruvboxRedSign = { bg = colors.dark0_hard },
            GruvboxYellowSign = { bg = colors.dark0_hard },
            GruvboxGreenSign = { bg = colors.dark0_hard },
            GruvboxAquaSign = { bg = colors.dark0_hard },

            DashboardHeader = { link = 'GruvboxGreen' },
            DashboardCenter = { link = 'GruvboxBlue' },
            DashboardCenterIcon = { link = 'GruvboxOrange' },
            DashboardShortcut = { link = 'GruvboxRed' },
            DashboardFooter = { link = 'GruvboxYellow' },

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

    vim.cmd('colorscheme gruvbox')
end

return M
