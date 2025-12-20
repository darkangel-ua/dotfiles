local lsp_document_highlight_group = vim.api.nvim_create_augroup('lsp_document_highlight_group', { clear = true })

local
function cursor_hold_actions(client, bufnr)
    vim.api.nvim_create_autocmd( {'CursorHold', 'CursorHoldI' }, {
        group = lsp_document_highlight_group,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })
    vim.api.nvim_create_autocmd( 'CursorMoved', {
        group = lsp_document_highlight_group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
    })
end

local
function keymaps(client, bufnr)
    local function keymap(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr, silent = true, noremap = true })
    end

    keymap('n', '\\', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, 'LSP: Toggle inlay hints')
    keymap('n', 'gd', function() require('settings.plugins.telescope').lsp_definitions() end, 'LSP: Go to definition')
    keymap('n', 'gD', "<cmd>Telescope lsp_type_definitions<cr>", 'LSP: Go to type definition')
    keymap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", 'LSP: Go to implementation')
    keymap('v', 'gi', ":TSCppDefineClassFunc<cr>", 'LSP: Define class func')
    keymap('n', 'gr', function() require('settings.plugins.telescope').lsp_references() end, 'LSP: Find references')
    keymap('n', 'ga', vim.lsp.buf.code_action, 'LSP: Code action')
    keymap('n', 'K', vim.lsp.buf.hover, 'LSP: Hover')
    keymap('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", 'LSP: Rename')
    keymap('n', '<leader>o', function() require('settings.plugins.telescope').lsp_document_symbols() end, 'LSP: Document symbols')
    keymap('n', 'gs', function() require('settings.plugins.telescope').lsp_dynamic_workspace_symbols() end, 'LSP: Workspace symbols')
    keymap('v', '<C-f>', "<cmd>lua vim.lsp.buf.format()<cr><esc>", 'LSP: Format selection')
    keymap('n', '<C-f>', "va{<bar><cmd>lua vim.lsp.buf.format()<cr><esc>", 'LSP: Format inside {}')

    if client.name == 'clangd' and vim.bo[bufnr].filetype == 'cpp' then
        keymap('n', 'gh', "<cmd>ClangdSwitchSourceHeader<cr>", 'LSP: Switch source/header')
    end
end

local
function on_lsp_attach(client, bufnr)
    cursor_hold_actions(client, bufnr)
    keymaps(client, bufnr)
end

local capabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.config('clangd', {
      cmd = { "clangd", "--malloc-trim" },
      init_options = {
        clangdFileStatus = true
      },
      on_attach = on_lsp_attach,
      capabilities = capabilities
})
vim.lsp.enable('clangd')

vim.lsp.config('cmake', {
    init_options = {
        buildDirectory = '.build/Debug',
    },
})
vim.lsp.enable('cmake')
