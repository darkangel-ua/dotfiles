local M = {}

function M.setup() 
    require('project_nvim').setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { '.git', 'compile_commands.json' }
    })
end

return M
