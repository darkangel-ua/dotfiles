vim.g.mapleader = ' '

vim.g.gruvbox_contrast_dark = 'hard'
vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true

local r, m = pcall(require, 'impatient')
-- if r then m.enable_profile() end -- use :LuaCacheProfile to see profiling data

require('plugins')
require('packer_compiled')
require('settings')

-- for reasons unknown to me this should be here to apply
vim.g.airline_powerline_fonts = 1

vim.cmd[[ colorscheme gruvbox ]]
