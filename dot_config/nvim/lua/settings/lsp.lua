local
function cursor_hold_actions(client, bufnr)
    local lightbulb = require('nvim-lightbulb')

    local cursor_hold_acg = vim.api.nvim_create_augroup('cursor_hold', { clear = true })
    vim.api.nvim_create_autocmd( {'CursorHold', 'CursorHoldI' }, {
        buffer = bufnr,
        group = cursor_hold_acg,
        callback = function()
            vim.lsp.buf.document_highlight()
            lightbulb.update_lightbulb()
        end,
    })
    vim.api.nvim_create_autocmd( 'CursorMoved', {
        buffer = bufnr,
        group = cursor_hold_acg,
        callback = vim.lsp.buf.clear_references,
    })
end

local
function on_lsp_attach(client, bufnr)
    require('nvim-navic').attach(client, bufnr)
    cursor_hold_actions(client, bufnr)
end

require('clangd_extensions').setup {
  server = {
      init_options = {
        clangdFileStatus = true
      },
      on_attach = on_lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
  },
}

local lspconfig = require('lspconfig')
lspconfig.cmake.setup {
    init_options = {
        buildDirectory = '.build/Debug',
    },
}

-- make signs same as in trouble.nvim
vim.cmd [[
    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
    sign define DiagnosticSignWarning text= texthl=DiagnosticSignWarning linehl= numhl=
]]

