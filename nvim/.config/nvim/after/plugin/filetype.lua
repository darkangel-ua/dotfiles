require('filetype').setup({
    overrides = {
        literal = {
            ['.bashrc.local'] = 'sh',
            ['.bash_aliases'] = 'sh',
            ['.profile.local'] = 'sh',
        }
    }
})
