-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/darkangel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/darkangel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/darkangel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/darkangel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/darkangel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { " require('Comment').setup() " },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { " require('settings.diffview') " },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { " require('gitsigns').setup() " },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["kmonad-vim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/kmonad-vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { " require('settings.nvim-treesitter') " },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["stabilize.nvim"] = {
    config = { ' require("stabilize").setup() ' },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/stabilize.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["telescope.nvim"] = {
    config = { " require('plugins.telescope').setup() " },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\29use_lsp_diagnostic_signs\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-cmake"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-strip-trailing-whitespace"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-strip-trailing-whitespace"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/darkangel/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
 require("stabilize").setup() 
time([[Config for stabilize.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
 require('plugins.telescope').setup() 
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
 require('settings.nvim-treesitter') 
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
 require('Comment').setup() 
time([[Config for Comment.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
 require('settings.diffview') 
time([[Config for diffview.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
 require('gitsigns').setup() 
time([[Config for gitsigns.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\29use_lsp_diagnostic_signs\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
