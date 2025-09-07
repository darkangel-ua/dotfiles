require("nvim-lightbulb").setup({
  autocmd = { enabled = false }
})

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

    -- disable hints by default because it's pretty annoying
    -- will use keys to toggle when neededw
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local lspconfig = require('lspconfig')
local capabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)
lspconfig.clangd.setup {
      cmd = { "clangd", "--malloc-trim" },
      init_options = {
        clangdFileStatus = true
      },
      on_attach = on_lsp_attach,
      capabilities = capabilities
}

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

