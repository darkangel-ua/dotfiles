local Hydra = require('hydra')
local splits = require('smart-splits')
local windows = require('winshift')

local M = {}

function M.setup()
    Hydra({
        name = 'Window management',
        config = {
            invoke_on_body = true,
            color = 'pink',
        },
        mode = 'n',
        body = '<leader>hw',
        heads = {
            { 'h' , function() splits.resize_left(1) end },
            { 'j' , function() splits.resize_down(1) end },
            { 'k' , function() splits.resize_up(1) end },
            { 'l' , function() splits.resize_right(1) end },
            { '<C-h>' , function() splits.resize_left(10) end },
            { '<C-j>' , function() splits.resize_down(5) end },
            { '<C-k>' , function() splits.resize_up(5) end },
            { '<C-l>' , function() splits.resize_right(10) end },
            { 'H', ':WinShift left<cr>', { silent = true, desc = 'Move left' } },
            { 'J', ':WinShift down<cr>', { silent = true, desc = 'Move down' } },
            { 'K', ':WinShift up<cr>', { silent = true, desc = 'Move up' } },
            { 'L', ':WinShift right<cr>', { silent = true, desc = 'Move right' } },
            { 's', ':WinShift swap<cr>', { silent = true, desc = 'Swap' } },
            { 'q', nil, { exit = true, nowait = true } },
        }
    })

    Hydra({
        name = 'Git hunk movements',
        config = {
            invoke_on_body = true,
            color = 'amaranth',
        },
        mode = 'n',
        body = '<leader>hg',
        heads = {
            { 'j' , ':Gitsigns next_hunk<cr>', { silent = true, desc = 'Next hunk'} },
            { 'k' , ':Gitsigns prev_hunk<cr>', { silent = true, desc = 'Prev hunk' } },
            { 'q', nil, { exit = true, nowait = true } },
        }
    })
end

return M
