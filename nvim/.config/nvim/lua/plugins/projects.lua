local M = {}

function M.setup() 
    require('project_nvim').setup({})
    require('telescope').load_extension('projects')
end

function M.edit_project_list()
    local f = vim.fn.stdpath('data') .. '/project_nvim/project_history'
    if vim.fn.filewritable(f) == 1 then
        vim.cmd(':e ' .. f)
    end
end

return M
