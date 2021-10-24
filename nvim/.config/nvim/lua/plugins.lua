local need_sync = vim.fn.filewritable(vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua') ~= 1

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors
  use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
  use 'ap/vim-css-color'
  use 'kmonad/kmonad-vim'

  use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = [[ require('plugins.telescope').setup() ]]
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'akinsho/bufferline.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- -- use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- Editing
  use 'axelf4/vim-strip-trailing-whitespace'
  use 'machakann/vim-highlightedyank'
  use 'tpope/vim-surround'
  -- use 'tomtom/tcomment_vim'
  use { 'numToStr/Comment.nvim', config = [[ require('Comment').setup() ]] }

  -- building
  use 'cdelledonne/vim-cmake'

  -- git
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', config = [[ require('gitsigns').setup() ]] }
  use { 'sindrets/diffview.nvim', config = [[ require('settings.diffview') ]] }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup { use_lsp_diagnostic_signs = true }
      end
  }
  use { 'nvim-treesitter/nvim-treesitter', config = [[ require('settings.nvim-treesitter') ]] }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', branch = '0.5-compat' }
  use 'kosayoda/nvim-lightbulb'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

   -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
  use { 'windwp/nvim-autopairs' }

  -- Profiling
  use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }

  if need_sync then
      require('packer').sync()
  end
end)

