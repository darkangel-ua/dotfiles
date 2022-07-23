-- partially reload some plugins and settings
-- don't know yet how to reload everything properly
local M = {}

function M.reload_all()
    local notify = require('notify')
    local reload = require('plenary.reload').reload_module
    local source = require('settings').source

    -- unload local settings modules
    reload('keymaps')
    reload('settings.options')
    reload('settings.snippets')

    reload('settings.plugins.cmake')

    -- apply settings
    require('keymaps')
    require('settings.options')
    require('settings.snippets')
    require('cmp_luasnip').clear_cache()

    notify('Config has been reloaded', 'info', { title = 'Reload', timeout = 2000 })

    -- trick to self-unload
    reload('settings.reload')
end

function M.source_current_file()
    local notify = require('notify')
    if vim.bo.filetype == 'vim' or vim.bo.filetype == 'lua' then
        vim.cmd('source ' .. vim.api.nvim_buf_get_name(0))
        notify("Current file has been sourced", 'info', { title = 'Reload', timeout = 2000 })
    else
        notify("Don't know how to source " .. vim.api.nvim_buf_get_name(0), 'error', { title = 'Reload', timeout = 5000})
    end
end

return M
