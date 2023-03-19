local opt = vim.opt

opt.guicursor = ''

opt.hidden = true
opt.backup = false
opt.writebackup = false
-- we have lualine - no need to show mode twice
opt.showmode = false
-- turn hybrid line numbers on
opt.number = true
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 300
-- Don't pass messages to |ins-completion-menu|.
opt.shortmess = opt.shortmess + 'c'
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
opt.signcolumn = 'yes'
-- Enable filetype plugins
vim.cmd [[ filetype plugin on ]]
-- use system clipboard on yank and paste
opt.clipboard = 'unnamedplus'
-- indentation settings
vim.cmd [[ filetype indent on ]]
-- set smartindent " can't use smartindent with filetype indentation
opt.autoindent = true
-- Use spaces instead of tabs
opt.expandtab = true
-- Be smart when using tabs ;)
opt.smarttab = true
-- 1 tab == 4 spaces
opt.shiftwidth = 4

opt.tabstop=4

-- Search options
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true

-- lets try to move swap file to memory - just to check if this will
-- prevent from nvim freezes because of disk io load
vim.go.directory = '/tmp/nvim.'..vim.env.USER..'/swap//'

-- this section is options for terminal
vim.cmd [[
augroup my_term_settings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup end
]]
