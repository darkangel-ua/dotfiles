local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_status.config({
    show_filename = false,
    diagnostics = false,
    kind_labels = {
    -- just copied this from lsp-kind plugin
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  }
})

lsp_status.register_progress()

lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = capabilities,
})

vim.cmd [[
    sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
]]

vim.api.nvim_command [[autocmd CursorHold  * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI * lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved * lua vim.lsp.buf.clear_references()]]

vim.cmd [[ autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb() ]]

