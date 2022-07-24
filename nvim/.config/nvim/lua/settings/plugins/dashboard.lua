local M = {}

function M.setup()
    local db = require('dashboard')
    db.header_pad = 5
    db.center_pad = 10
    db.footer_pad = 20

    db.custom_header = {
        [[                                  __                ]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        [[                                                    ]],
    }

    db.custom_center = {
        { icon = '  ', desc = 'Recently opened files                   ', shortcut = 'SPC f o', action = "lua require('telescope.builtin').oldfiles()" },
        { icon = '⎋  ', desc = 'Exit                                    ', shortcut = '      q', action = 'q' },
    }
end

return M
