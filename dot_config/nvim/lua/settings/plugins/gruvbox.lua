local M = {}

function M.setup()
    local colors = require('gruvbox.palette').get_base_colors(nil, "hard")
    require("gruvbox").setup({
        contrast = "hard",
        overrides = {
            -- make sign column same as background
            SignColumn = { bg = colors.bg0 },
            GruvboxRedSign = { bg = colors.bg0 },
            GruvboxYellowSign = { bg = colors.bg0 },
            GruvboxGreenSign = { bg = colors.bg0 },
            GruvboxAquaSign = { bg = colors.bg0 },

            DashboardHeader = { link = 'GruvboxGreen' },
            DashboardDesc = { link = 'GruvboxBlue' },
            DashboardKey = { link = 'GruvboxRed' },
            DashboardFooter = { link = 'GruvboxYellow' },
            DashboardIcon = { link = 'GruvboxOrange' },

            DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = true },
            DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = true },
            DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = true },
            DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = true },

            LuasnipInsertNodePassive = { fg = colors.blue, bg = colors.bg1, italic = true },
            LuasnipChoiceNodePassive = { fg = colors.blue, bg = colors.bg1, italic = true },
            LuasnipExitNodePassive = { fg = colors.red, bg = colors.bg1, italic = true },

            HopNextKey = { link = "GruvboxOrangeBold" },
            HopNextKey1 = { link = "GruvboxOrangeBold" },
            HopNextKey2 = { link = "GruvboxOrange" },

            Pmenu = { bg = colors.bg1 },
        },
    })

    vim.cmd('colorscheme gruvbox')
end

return M
