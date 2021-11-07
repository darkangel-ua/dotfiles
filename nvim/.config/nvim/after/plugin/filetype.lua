require('filetype').setup({
    overrides = {
        literal = {
            ['.bashrc.local'] = 'sh',
            ['.profile.local'] = 'sh',
        }
    }
})
