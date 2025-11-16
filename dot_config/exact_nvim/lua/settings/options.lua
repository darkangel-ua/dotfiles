vim.o.guicursor = ''

vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
-- we have lualine - no need to show mode twice
vim.o.showmode = false
-- turn hybrid line numbers on
vim.o.number = true
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 300
-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess .. 'c'
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'
-- Enable filetype plugins
vim.cmd.filetype('plugin', 'on')
-- Set up OSC 52 as the clipboard provider.
-- This tells Neovim to use the terminal's OSC 52 capability for copy/paste.
vim.g.clipboard = 'osc52'
-- indentation settings
vim.cmd.filetype('indent', 'on')
-- set smartindent " can't use smartindent with filetype indentation
vim.o.autoindent = true
-- Use spaces instead of tabs
vim.o.expandtab = true
-- Be smart when using tabs ;)
vim.o.smarttab = true
-- 1 tab == 4 spaces
vim.o.shiftwidth = 4

vim.o.tabstop=4

-- Search vim.oions
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true

-- lets try to move swap file to memory - just to check if this will
-- prevent from nvim freezes because of disk io load
vim.go.directory = '/tmp/nvim.'..vim.env.USER..'/swap//'

-- this section is options for terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('my_term_settings', { clear = true }),
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
    end
})
