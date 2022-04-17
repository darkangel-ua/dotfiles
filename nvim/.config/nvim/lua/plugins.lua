local need_sync = vim.fn.filewritable(vim.fn.stdpath('config') .. '/lua/packer_compiled.lua') ~= 1

require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- system
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'
  use { 'rcarriga/nvim-notify', config = function() require('notify').setup() end }
  use { 'numToStr/FTerm.nvim', config = function() require('settings.plugins.fterm').setup() end }

  -- Colors
  use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
  use 'ap/vim-css-color'
  use 'kmonad/kmonad-vim'

  -- Navigation
  use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = [[ require('settings.plugins.telescope').setup() ]]
  }
  use {
      'ahmedkhalf/project.nvim',
      requires = 'nvim-telescope/telescope.nvim',
      config = [[ require('settings.plugins.projects').setup() ]]
  }
  use {
      'nvim-telescope/telescope-file-browser.nvim',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require("telescope").load_extension "file_browser" end
  }
  use {
      'christoomey/vim-tmux-navigator',
      setup = function() require('settings.plugins.vim-tmux') end,
  }

-- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use { 'akinsho/bufferline.nvim', branch = 'main' }
  use {
      'nvim-lualine/lualine.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require('settings.plugins.lualine').setup() end
   }

  -- Editing
  use 'axelf4/vim-strip-trailing-whitespace'
  use 'tpope/vim-surround'
  -- to uncomment word use gciC inside comment block. Here iC is treesitter comment text object
  use { 'numToStr/Comment.nvim', config = [[ require('Comment').setup() ]] }
  use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end }
  use {
      'AckslD/nvim-neoclip.lua',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.neoclip').setup() end
  }
  use { 'phaazon/hop.nvim', config = function() require('hop').setup() end }

  -- building
  use { 'darkangel-ua/vim-cmake', branch = 'generate-cmake-codemodel' }
  -- use { "Shatur/neovim-cmake", config = function() require("cmake").setup({}) end }

  -- debugging
  use { "mfussenegger/nvim-dap", config = function() require('settings.plugins.nvim-dap') end }

  -- git
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', config = function() require('settings.plugins.gitsigns').setup() end }
  use { 'sindrets/diffview.nvim', config = [[ require('settings.plugins.diffview') ]] }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use { 'j-hui/fidget.nvim', config = function() require('fidget').setup({ text = { spinner = 'dots_negative' } }) end }
  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require("settings.plugins.trouble").setup() end
  }
  use { 'nvim-treesitter/nvim-treesitter', config = [[ require('settings.plugins.nvim-treesitter') ]] }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'RRethy/nvim-treesitter-endwise' }
  use 'kosayoda/nvim-lightbulb'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use {
      'Badhi/nvim-treesitter-cpp-tools',
      requires = 'nvim-treesitter/nvim-treesitter'
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-cmdline'
  use 'f3fora/cmp-spell'
  use 'saadparwaiz1/cmp_luasnip'
  -- use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
  use { 'windwp/nvim-autopairs' }

  -- Profiling
  use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }

  if need_sync then
      require('packer').sync()
  end
end,
config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
 }})
