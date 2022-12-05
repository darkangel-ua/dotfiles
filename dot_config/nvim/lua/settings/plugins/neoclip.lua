local M = {}

function M.setup()
    require('neoclip').setup({
        keys = {
            telescope = {
                i = {
                    select = '<C-P>',
                    paste = '<cr>',
                    paste_behind = '<c-o>',
                    custom = {},
                },
                n = {
                    select = '<C-P>',
                    paste = '<cr>',
                    paste_behind = 'o',
                    custom = {},
                },
            },
        },
    })

    -- looks like it doesn't work without this properly
    require('telescope').load_extension('neoclip')
end

return M
