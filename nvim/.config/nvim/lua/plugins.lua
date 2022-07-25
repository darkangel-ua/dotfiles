local need_sync = vim.fn.filewritable(vim.fn.stdpath('config') .. '/lua/packer_compiled.lua') ~= 1

require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- system
  use {
      'nathom/filetype.nvim',
      config = function() require('settings.plugins.filetype').setup() end,
  }
  use 'lewis6991/impatient.nvim'
  use {
      'rcarriga/nvim-notify',
      requires = 'nvim-telescope/telescope.nvim',
      config = function()
          require('notify').setup()
          require('telescope').load_extension('notify')
      end
  }
  use {
      'numToStr/FTerm.nvim',
      config = function() require('settings.plugins.fterm').setup() end,
      module = 'FTerm',
  }

  -- Colors
  use {
      'ellisonleao/gruvbox.nvim',
      config = function() require('settings.plugins.gruvbox').setup() end,
  }
  use 'ap/vim-css-color'
  use 'kmonad/kmonad-vim'

  -- dashboard
  use {
      'glepnir/dashboard-nvim',
      config = function() require('settings.plugins.dashboard').setup() end,
  }

  use {
      'Shatur/neovim-session-manager',
      config = function() require('settings.plugins.neovim-session-manager').setup() end,
  }

  -- Navigation
  use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
      config = function() require('settings.plugins.telescope').setup() end,
  }
  use {
      'ahmedkhalf/project.nvim',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.projects').setup() end,
  }
  use {
      'nvim-telescope/telescope-file-browser.nvim',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require('telescope').load_extension('file_browser') end
  }
  use {
      'christoomey/vim-tmux-navigator',
      setup = function() require('settings.plugins.vim-tmux') end,
  }
  use {
      'mrjones2014/smart-splits.nvim',
      config = function() require('smart-splits').setup({}) end
  }
  use {
      'anuvyklack/hydra.nvim',
      requires = 'anuvyklack/keymap-layer.nvim',
      config = function() require('settings.plugins.hydra').setup() end
  }
  use {
      'sindrets/winshift.nvim',
      config = function() require('settings.plugins.winshift').setup() end
  }
  use {
      'nvim-telescope/telescope-ui-select.nvim',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require("telescope").load_extension("ui-select") end,
  }

-- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use {
      'akinsho/bufferline.nvim',
      branch = 'main',
      config = function() require('settings.plugins.bufferline').setup() end,
      after = 'gruvbox.nvim'
  }
  -- hide all buffers that doesn't belong to current tab from bufferline
  use {
      'tiagovla/scope.nvim',
      config = function() require('scope').setup() end,
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', 'SmiteshP/nvim-navic' },
      config = function() require('settings.plugins.lualine').setup() end,
      after = 'nvim-navic',
   }

  -- Editing
  use {
      'antoinemadec/FixCursorHold.nvim',
      config = function() vim.g.cursorhold_updatetime = 300 end
  }
  use 'axelf4/vim-strip-trailing-whitespace'
  use {
      'kylechui/nvim-surround',
      config = function() require('nvim-surround').setup({}) end,
  }
  -- to uncomment word use gciC inside comment block. Here iC is treesitter comment text object
  use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      event = { 'BufRead', 'InsertEnter' },
  }
  use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end }
  use {
      'AckslD/nvim-neoclip.lua',
      requires = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.neoclip').setup() end
  }
  use {
      'phaazon/hop.nvim',
      config = function() require('hop').setup() end,
      event = { 'BufRead', 'InsertEnter' },
  }

  -- building
  use { 'darkangel-ua/vim-cmake', branch = 'generate-cmake-codemodel' }
  -- use { 'Shatur/neovim-cmake', config = function() require('cmake').setup({}) end }

  -- debugging
  use { 'mfussenegger/nvim-dap', config = function() require('settings.plugins.nvim-dap') end }

  -- git
  use 'tpope/vim-fugitive'
  use {
      'lewis6991/gitsigns.nvim',
      config = function() require('settings.plugins.gitsigns').setup() end,
      event = { 'BufAdd', 'BufWrite' },
  }
  use {
      'sindrets/diffview.nvim',
      config = function() require('settings.plugins.diffview') end,
      cmd = { 'DiffviewOpen' },
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
      'SmiteshP/nvim-navic',
      config = function() require('settings.plugins.nvim-navic').setup() end,
  }
  use {
      'j-hui/fidget.nvim',
      config = function() require('fidget').setup({ text = { spinner = 'dots_negative' } }) end,
      ft = { 'cpp' },
  }
  use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require('settings.plugins.trouble').setup() end,
      cmd = { 'TroubleToggle', 'TroubleClose' },
  }
  use { 'nvim-treesitter/nvim-treesitter', config = function() require('settings.plugins.nvim-treesitter') end }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'RRethy/nvim-treesitter-endwise', event = 'InsertEnter' }
  use 'kosayoda/nvim-lightbulb'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use {
      'Badhi/nvim-treesitter-cpp-tools',
      requires = 'nvim-treesitter/nvim-treesitter',
      ft = 'cpp',
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-cmdline'
  use 'f3fora/cmp-spell'
  use 'saadparwaiz1/cmp_luasnip'
  -- use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
  use { 'windwp/nvim-autopairs' }

  -- Profiling
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

  if need_sync then
      require('packer').sync()
  end
end,
config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
 }})
