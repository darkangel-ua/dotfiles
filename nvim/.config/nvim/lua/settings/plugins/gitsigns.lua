local M = {}

function M.setup()
    require('gitsigns').setup({
        on_attach = function(bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', ':Gitsigns preview_hunk<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', ':Gitsigns stage_hunk<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hs', ':Gitsigns stage_hunk<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hr', ':Gitsigns reset_hunk<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hr', ':Gitsigns reset_hunk<cr>', { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>', { silent = true })
        end
    })
end

return M
