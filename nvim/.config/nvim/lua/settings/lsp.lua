local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup({
  init_options = {
    clangdFileStatus = true
  },
  on_attach = require('settings.plugins.nvim-navic').attach,
  capabilities = capabilities,
})

-- make signs same as in trouble.nvim
vim.cmd [[
    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
    sign define DiagnosticSignWarning text= texthl=DiagnosticSignWarning linehl= numhl=
]]

vim.api.nvim_command [[autocmd CursorHold  * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved * lua vim.lsp.buf.clear_references()]]

vim.cmd [[ autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb() ]]

