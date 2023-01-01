local function source(filepath)
    vim.cmd("source " .. vim.fn.stdpath('config') .. "/lua/settings/" .. filepath)
end

require('settings.filetypes')
require('settings.options')

source('highlighted_yank.vim')
source('chezmoi.vim')

return { source = source }
