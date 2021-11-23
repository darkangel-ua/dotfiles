local M = {}

function M.apply()
    local lush = require('lush')
    local base = require('gruvbox.base')
    local my_colors = lush(function()
        return {
            TelescopePreviewLine { bg = base.GruvboxBlue.fg.hex, fg = base.GruvboxBg1.fg.hex, gui = "bold" },
            LuasnipInsertNodePassive { bg = base.GruvboxBg1.fg.hex, fg = base.GruvboxBlue.fg.hex, gui = "italic" },
            LuasnipChoiceNodePassive { bg = base.GruvboxBg1.fg.hex, fg = base.GruvboxBlue.fg.hex, gui = "italic" },
            LuasnipExitNodePassive { bg = base.GruvboxBg1.fg.hex, fg = base.GruvboxRed.fg.hex, gui = "italic" },
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

