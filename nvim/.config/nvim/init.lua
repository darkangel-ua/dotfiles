vim.g.mapleader = ' '

vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true

local r, m = pcall(require, 'impatient')
-- if r then m.enable_profile() end -- use :LuaCacheProfile to see profiling data

require('plugins')
require('packer_compiled')
require('settings')
