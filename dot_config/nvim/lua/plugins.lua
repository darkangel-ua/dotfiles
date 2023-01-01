local lazy_options = {
    defaults = {
        lazy = true,
    },
}

local on_some_buffer = { 'BufReadPre', 'BufAdd', }

require('lazy').setup({
  -- system
  {
      'rcarriga/nvim-notify',
      dependencies = 'nvim-telescope/telescope.nvim',
      config = true,
  },
  {
      'nvim-telescope/telescope-ui-select.nvim',
      dependencies = 'nvim-telescope/telescope.nvim',
      config = function() require("telescope").load_extension("ui-select") end,
      event = { 'VeryLazy' },
  },
  {
      'numToStr/FTerm.nvim',
      config = function() require('settings.plugins.fterm').setup() end,
  },

  -- Colors
  {
      'ellisonleao/gruvbox.nvim',
      config = function() require('settings.plugins.gruvbox').setup() end,
      lazy = false,
  },
  { 'ap/vim-css-color', event = on_some_buffer, },
  { 'kmonad/kmonad-vim', ft = 'kbd', },

  -- dashboard
  {
      'glepnir/dashboard-nvim',
      config = function() require('settings.plugins.dashboard').setup() end,
      lazy = false,
  },
  {
      'Shatur/neovim-session-manager',
      config = function() require('settings.plugins.neovim-session-manager').setup() end,
      cmd = { 'SessionManager' },
  },

  -- Navigation
  {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
      config = function() require('settings.plugins.telescope').setup() end,
      cmd = { 'Telescope' },
  },
  {
      'darkangel-ua/telescope-fzf-native.nvim',
      branch = 'keep_lines_order',
      dependencies = 'nvim-telescope/telescope.nvim',
      build = 'make',
  },
  {
      'ahmedkhalf/project.nvim',
      dependencies = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.projects').setup() end,
  },
  {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = 'nvim-telescope/telescope.nvim',
  },
  {
      'christoomey/vim-tmux-navigator',
      init = function() require('settings.plugins.vim-tmux') end,
      cmd = { 'TmuxNavigateLeft', 'TmuxNavigateRight',  'TmuxNavigateUp',  'TmuxNavigateDown' },
  },
  {
      'mrjones2014/smart-splits.nvim',
      config = {},
  },
  {
      'anuvyklack/hydra.nvim',
      dependencies = 'anuvyklack/keymap-layer.nvim',
      config = function() require('settings.plugins.hydra').setup() end,
      event = 'VeryLazy',
  },
  {
      'sindrets/winshift.nvim',
      config = function() require('settings.plugins.winshift').setup() end,
      cmd = { 'WinShift' },
  },

  -- Icons
  'kyazdani42/nvim-web-devicons',

  -- Status Line and Bufferline
  {
      'akinsho/bufferline.nvim',
      branch = 'main',
      config = function() require('settings.plugins.bufferline').setup() end,
      event = on_some_buffer,
  },
  -- hide all buffers that doesn't belong to current tab from bufferline
  {
      'tiagovla/scope.nvim',
      config = true,
      event = on_some_buffer,
  },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', 'SmiteshP/nvim-navic', 'Shatur/neovim-session-manager' },
      config = function() require('settings.plugins.lualine').setup() end,
      event = on_some_buffer,
   },

  -- Editing
  { 'axelf4/vim-strip-trailing-whitespace', event = on_some_buffer, },
  {
      'famiu/bufdelete.nvim',
      cmd = { 'Bdelete', 'Bwipeout' }
  },
  {
      'kylechui/nvim-surround',
      config = {},
      event = on_some_buffer,
  },
  -- to uncomment word use gciC inside comment block. Here iC is treesitter comment text object
  {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      event = on_some_buffer,
  },
  { 'lewis6991/spellsitter.nvim', config = true, event = on_some_buffer, },
  {
      'AckslD/nvim-neoclip.lua',
      dependencies = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.neoclip').setup() end,
      event = on_some_buffer,
  },
  {
      'phaazon/hop.nvim',
      config = true,
  },

  -- building
  {
    'darkangel-ua/vim-cmake',
    branch = 'generate-cmake-codemodel',
    cmd = { 'CMakeOpen', 'CMakeClose', 'CMakeGenerate', 'CMakeBuild', },
  },
  -- use { 'Shatur/neovim-cmake', config = function() require('cmake').setup({}) end }

  -- debugging
  { 'mfussenegger/nvim-dap', config = function() require('settings.plugins.nvim-dap') end },

  -- git
  { 'tpope/vim-fugitive', event = on_some_buffer, },
  {
      'lewis6991/gitsigns.nvim',
      config = function() require('settings.plugins.gitsigns').setup() end,
      event = on_some_buffer,
  },
  {
      'sindrets/diffview.nvim',
      config = function() require('settings.plugins.diffview') end,
      cmd = { 'DiffviewOpen' },
  },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', config = function() require('settings.plugins.nvim-treesitter') end },
  { 'nvim-treesitter/nvim-treesitter-textobjects', event = on_some_buffer, },
  { 'RRethy/nvim-treesitter-endwise', event = 'InsertEnter' },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function() require('settings.lsp') end,
    ft = { 'cpp' },
  },
  {
      'SmiteshP/nvim-navic',
      config = function() require('settings.plugins.nvim-navic').setup() end,
  },
  {
      'j-hui/fidget.nvim',
      config = function() require('fidget').setup({ text = { spinner = 'dots_negative' } }) end,
      ft = { 'cpp' },
  },
  {
      'folke/trouble.nvim',
      dependencies = 'kyazdani42/nvim-web-devicons',
      config = function() require('settings.plugins.trouble').setup() end,
      cmd = { 'TroubleToggle', 'TroubleClose' },
  },
  { 'kosayoda/nvim-lightbulb', ft = { 'cpp' }, },
  { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
  {
      'Badhi/nvim-treesitter-cpp-tools',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      ft = 'cpp',
  },
  { 'p00f/clangd_extensions.nvim', ft = { 'cpp' }, },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    config = function() require('settings.snippets') end,
    ft = { 'cpp', 'cmake', },
  },

  -- Autocomplete
  { 'windwp/nvim-autopairs', config = true },
  {
      'hrsh7th/nvim-cmp',
      dependencies = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-nvim-lsp-signature-help',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-calc',
          'hrsh7th/cmp-cmdline',
          'f3fora/cmp-spell',
          'saadparwaiz1/cmp_luasnip',
          'windwp/nvim-autopairs',
      },
      config = function() require('settings.plugins.nvim-cmp') end,
      event = { 'CmdlineEnter', 'InsertEnter' },
  },

  -- Profiling
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
}, lazy_options)
