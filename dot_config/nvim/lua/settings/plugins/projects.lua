local M = {}

function M.setup() 
    require('project_nvim').setup({
        patterns = { '.git', 'compile_commands.json' }
    })
end

return M
