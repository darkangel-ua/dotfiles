local M = {}

function M.setup() 
    require('project_nvim').setup({
        patterns = { '.git', 'compile_commands.json' }
    })
    require('telescope').load_extension('projects')
end

return M
