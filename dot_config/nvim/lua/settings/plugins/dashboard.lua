local M = {}

function M.setup()
    local db = require('dashboard')
    db.center_pad = 5
    db.footer_pad = 20

    db.custom_header = {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⣀⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣄⠀⠀⠀]],
    [[⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣷⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀]],
    [[⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡂⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
    [[⠀⠀⠙⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀]],
    [[⠀⠀⠀⠀⠙⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⡿⠋⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋       ]],
    [[                               ]],
}
    local iconhl = { link = 'GruvboxOrange' }
    db.custom_center = {
        { icon = '☰  ', icon_hl = iconhl, desc = 'Load session                            ', shortcut = '      O', action = "SessionManager load_session" },
        { icon = '  ', icon_hl = iconhl, desc = 'Load last session                       ', shortcut = '      S', action = "SessionManager load_last_session" },
        { icon = '  ', icon_hl = iconhl, desc = 'Load current dir session                ', shortcut = '      C', action = "SessionManager load_current_dir_session" },
        { icon = '  ', icon_hl = iconhl, desc = 'Recently opened files                   ', shortcut = '      o', action = "lua require('telescope.builtin').oldfiles()" },
        { icon = '  ', icon_hl = iconhl, desc = 'Settings                                ', shortcut = '      s', action = "lua require('telescope.builtin').dotfiles()" },
        { icon = '⎋  ', icon_hl = iconhl, desc = 'Exit                                    ', shortcut = '      q', action = 'q' },
    }
end

return M
