local M = {}

function M.setup()
    local custom_gruvbox = require'lualine.themes.gruvbox'
    local navic = require('nvim-navic')
    local session_utils = require('session_manager.utils')

    custom_gruvbox.normal.c.fg = custom_gruvbox.visual.a.bg
    custom_gruvbox.insert.c.fg = custom_gruvbox.normal.c.fg
    custom_gruvbox.insert.c.bg = custom_gruvbox.normal.c.bg
    custom_gruvbox.replace.c = custom_gruvbox.normal.c
    custom_gruvbox.command.c = custom_gruvbox.normal.c
    custom_gruvbox.visual.c = custom_gruvbox.normal.c

    require('lualine').setup({
        options = {
            theme = custom_gruvbox,
            component_separators = '',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { { function() return 'Ⓢ ' end, cond = function() return session_utils.is_session end }, 'branch', 'diff', 'diagnostics' },
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { { function() return navic.get_location({}) end, cond = navic.is_available } },
            lualine_y = { 'filetype' },
            lualine_z = { 'progress', 'location' }
        },
    })
end

return M
