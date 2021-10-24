vim.g.mapleader = ' '

vim.g.gruvbox_contrast_dark = 'hard'
vim.o.background = "dark" -- or "light" for light mode

require('plugins')
require('settings')

vim.cmd([[colorscheme gruvbox]])

-- for reasons unknown to me this should be here to apply
vim.g.airline_powerline_fonts = 1
