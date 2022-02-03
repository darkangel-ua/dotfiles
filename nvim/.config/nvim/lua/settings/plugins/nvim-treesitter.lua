require('nvim-treesitter.configs').setup({
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aC"] = "@comment.outer",
                ["iC"] = "@comment.outer",
                ["aP"] = "@parameter.outer",
                ["iP"] = "@parameter.inner",
            },
        },
    },
    nt_cpp_tools = {
        enable = true,
        preview = {
            quit = 'q', -- optional keymapping for quit preview
            accept = 'i' -- optional keymapping for accept preview
        },
    },
})
