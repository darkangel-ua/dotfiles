vim.filetype.add({
    filename = {
        ['dot_profile'] = 'sh',
        ['dot_profile.tmpl'] = 'sh',
        ['dot_bashrc'] = 'sh',
        ['dot_bashrc.local'] = 'sh',
        ['dot_bash_aliases'] = 'sh',
        ['dot_bash_aliases.local'] = 'sh',
        ['dot_profile.local'] = 'sh',
        ['tmux.conf'] = 'tmux',
    },
    pattern = {
        ['.+%.toml%.tmpl'] = { 'toml' },
        ['.+%.sh%.tmpl'] = { 'sh' },
    },
})
