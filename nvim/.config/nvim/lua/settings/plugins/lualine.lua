local M = {}

function M.setup()
    local custom_gruvbox = require'lualine.themes.gruvbox'
    local navic = require('nvim-navic')
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
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { { navic.get_location, cond = navic.is_available } },
            lualine_y = {'filetype'},
            lualine_z = { 'progress', 'location' }
        },
    })
end

return M
