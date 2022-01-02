local function source(filepath)
    vim.cmd("source " .. vim.fn.stdpath('config') .. "/lua/settings/" .. filepath)
end

require('settings.colors')
require('settings.completion')
require('settings.lsp')
require('settings.options')
require("settings.snippets")

source('keymaps.vim')
source('highlighted_yank.vim')

return { source = source }
