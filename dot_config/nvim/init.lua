vim.g.mapleader = ' '

vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true

local r, m = pcall(require, 'impatient')
-- if r then m.enable_profile() end -- use :LuaCacheProfile to see profiling data

require('plugins')
-- keymaps should be infront of plugins so packer will be able to use keymap lazy loading
-- but actually it doesn't work - packer will not save/restore keys. It expects that after
-- plugin will be loaded it will re-define mappings which is not true in most of the cases
require('keymaps')
require('packer_compiled')
require('settings')
