vim.g.mapleader = ' '

vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true

local r, m = pcall(require, 'impatient')
-- if r then m.enable_profile() end -- use :LuaCacheProfile to see profiling data

-- keymaps should be infront of plugins so packer will be able to use keymap lazy loading
require('keymaps')
require('plugins')
require('packer_compiled')
require('settings')
