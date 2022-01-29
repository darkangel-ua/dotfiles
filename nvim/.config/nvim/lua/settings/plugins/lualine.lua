local M = {}

function M.setup()
    local custom_gruvbox = require'lualine.themes.gruvbox'
    custom_gruvbox.normal.c.fg = custom_gruvbox.visual.a.bg
    custom_gruvbox.insert.c.fg = custom_gruvbox.normal.c.fg
    custom_gruvbox.insert.c.bg = custom_gruvbox.normal.c.bg
    custom_gruvbox.replace.c = custom_gruvbox.normal.c
    custom_gruvbox.command.c = custom_gruvbox.normal.c
    custom_gruvbox.visual.c = custom_gruvbox.normal.c

    require('lualine').setup({
        options = { theme = custom_gruvbox },
        extensions = { 'fugitive' },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    })
end

return M
