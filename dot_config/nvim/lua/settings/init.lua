local function source(filepath)
    vim.cmd("source " .. vim.fn.stdpath('config') .. "/lua/settings/" .. filepath)
end

require('settings.completion')
require('settings.lsp')
require('settings.options')
require("settings.snippets")

source('highlighted_yank.vim')
source('chezmoi.vim')

return { source = source }