local M = {}

function M.apply()
    local lush = require('lush')
    local base = require('gruvbox.base')
    local my_colors = lush(function()
        return {
            LuasnipInsertNodePassive { bg = base.GruvboxBg1.fg, fg = base.GruvboxBlue.fg, gui = "italic" },
            LuasnipChoiceNodePassive { bg = base.GruvboxBg1.fg, fg = base.GruvboxBlue.fg, gui = "italic" },
            LuasnipExitNodePassive { bg = base.GruvboxBg1.fg, fg = base.GruvboxRed.fg, gui = "italic" },
            HopNextKey { fg = base.GruvboxOrange.fg, gui = 'bold' },
            HopNextKey1 { fg = base.GruvboxOrange.fg, gui = 'bold' },
            HopNextKey2 { fg = base.GruvboxOrange.fg },
            Pmenu { bg = base.GruvboxBg1.fg }
        }
    end)

    -- here is where color scheme applied
    lush(my_colors, { force_clear = false })
end

vim.cmd[[
augroup my_colors
    autocmd!
    autocmd ColorScheme * lua require('settings.colors').apply()
augroup END
]]

return M

