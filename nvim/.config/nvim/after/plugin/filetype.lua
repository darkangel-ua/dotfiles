require('filetype').setup({
    overrides = {
        literal = {
            ['.bashrc.local'] = 'sh',
            ['.bash_aliases'] = 'sh',
            ['.bash_aliases.local'] = 'sh',
            ['.profile.local'] = 'sh',
        }
    }
})
