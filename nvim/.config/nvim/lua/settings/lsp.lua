local lspconfig = require('lspconfig')

local config = {
  init_options = {
    clangdFileStatus = true
  },
  on_attach = require('settings.plugins.nvim-navic').attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  extensions = {
      autoSetHints = false,
  },
}
config = require('clangd_extensions').prepare(config)

lspconfig.clangd.setup(config)

-- make signs same as in trouble.nvim
vim.cmd [[
    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
    sign define DiagnosticSignWarning text= texthl=DiagnosticSignWarning linehl= numhl=
]]

vim.api.nvim_command [[autocmd CursorHold  * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved * lua vim.lsp.buf.clear_references()]]

vim.cmd [[ autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb() ]]

