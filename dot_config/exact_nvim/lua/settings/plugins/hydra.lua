local Hydra = require('hydra')
local splits = require('smart-splits')

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
            { 'H', '<cmd>WinShift left<cr>', { silent = true, desc = 'Move left' } },
            { 'J', '<cmd>WinShift down<cr>', { silent = true, desc = 'Move down' } },
            { 'K', '<cmd>WinShift up<cr>', { silent = true, desc = 'Move up' } },
            { 'L', '<cmd>WinShift right<cr>', { silent = true, desc = 'Move right' } },
            { 's', '<cmd>WinShift swap<cr>', { silent = true, desc = 'Swap' } },
            { 'q', nil, { exit = true, nowait = true } },
        }
    })

    Hydra({
        name = 'Git hunk movements',
        config = {
            invoke_on_body = true,
            color = 'pink',
        },
        mode = 'n',
        body = '<leader>hg',
        heads = {
            { 'j' , '<cmd>Gitsigns next_hunk<cr>', { silent = true, desc = 'Next hunk'} },
            { 'k' , '<cmd>Gitsigns prev_hunk<cr>', { silent = true, desc = 'Prev hunk' } },
            { 'p', '<cmd>Gitsigns preview_hunk<cr>', { silent = true, desc = 'Prev hunk' } },
            { 'q', nil, { exit = true, nowait = true } },
        }
    })

    Hydra({
        name = 'Buffers',
        config = {
            invoke_on_body = true,
            color = 'pink',
        },
        mode = 'n',
        body = '<leader>hb',
        heads = {
            { 'h' , '<cmd>BufferLineCyclePrev<cr>', { silent = true, desc = 'Prev buffer'} },
            { 'l' , '<cmd>BufferLineCycleNext<cr>', { silent = true, desc = 'Next buffer' } },
            { '<C-h>' , '<cmd>BufferLineMovePrev<cr>', { silent = true, desc = 'Move left'} },
            { '<C-l>' , '<cmd>BufferLineMoveNext<cr>', { silent = true, desc = 'Move right' } },
            { '<leader>l' , '<cmd>BufferLineCloseRight<cr>', { silent = true, desc = 'Close right' } },
            { '0' , '<cmd>BufferLineTogglePin<cr>', { silent = true, desc = 'Pin' } },
            { 'p' , '<cmd>BufferLinePick<cr>', { silent = true, desc = 'Pick' } },
            { 'q', nil, { exit = true, nowait = true } },
        }
    })
end

return M
