local M = {}

function M.setup()
    require('filetype').setup({
        overrides = {
            literal = {
                ['dot_profile'] = 'sh',
                ['dot_bashrc'] = 'sh',
                ['dot_bashrc.local'] = 'sh',
                ['dot_bash_aliases'] = 'sh',
                ['dot_bash_aliases.local'] = 'sh',
                ['dot_profile.local'] = 'sh',
            }
        }
    })
end

return M
