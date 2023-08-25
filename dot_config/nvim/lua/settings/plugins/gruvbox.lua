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

            LightBulbSign = { bg = colors.bg0 },

            DashboardHeader = { link = 'GruvboxGreen' },
            DashboardDesc = { link = 'GruvboxBlue' },
            DashboardKey = { link = 'GruvboxRed' },
            DashboardFooter = { link = 'GruvboxYellow' },
            DashboardIcon = { link = 'GruvboxOrange' },

            ["@lsp.type.namespace"] = { link = 'GruvboxAqua' },
            ["@lsp.type.class"] = { link = 'GruvboxAqua' },
            ["@lsp.type.enum"] = { link = 'GruvboxAqua' },
            ["@lsp.mod.readonly.cpp"] = { link = "GruvboxPurple" },
            ["@lsp.typemod.method.readonly.cpp"] = { link = "@lsp.type.method.cpp" },
            ["@lsp.type.macro.cpp"] = { fg = colors.red, bold = true },
            ["@lsp.type.parameter.cpp"] = { fg = colors.blue, italic = true },
            ["@lsp.type.variable.cpp"] = { fg = colors.fg1 },

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
