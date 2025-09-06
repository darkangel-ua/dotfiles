local lazy_options = {
    defaults = {
        lazy = true,
    },
    dev = {
        path = "~/projects/nvim-plugins",
    },
    performance = {
        rtp = {
            paths = { "~/.config/nvim.private" },
        },
    },
}

local on_some_buffer = { 'BufReadPre', 'BufAdd', }

plugins = {
  -- system
  {
      'rcarriga/nvim-notify',
      dependencies = 'nvim-telescope/telescope.nvim',
      opts = {},
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
  {
      'williamboman/mason.nvim',
      opts = {},
      event = 'VeryLazy',
  },

  -- Colors
  {
      'ellisonleao/gruvbox.nvim',
      tag = '1.1.0',
      config = function() require('settings.plugins.gruvbox').setup() end,
      lazy = false,
  },
  { 'ap/vim-css-color', event = on_some_buffer, },
  { 'kmonad/kmonad-vim', ft = 'kbd', },

  -- dashboard
  {
      'glepnir/dashboard-nvim',
      config = function() require('settings.plugins.dashboard').setup() end,
      event = { 'VimEnter' },
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
      'nvim-telescope/telescope-fzf-native.nvim',
      branch = 'main',
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
      'nvim-telescope/telescope-live-grep-args.nvim',
      dependencies = 'nvim-telescope/telescope.nvim',
  },
  {
      'christoomey/vim-tmux-navigator',
      init = function() require('settings.plugins.vim-tmux') end,
      cmd = { 'TmuxNavigateLeft', 'TmuxNavigateRight',  'TmuxNavigateUp',  'TmuxNavigateDown' },
  },
  { 'mrjones2014/smart-splits.nvim', opts = {} },
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
  {
      'chrishrb/gx.nvim',
      keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" }} },
      cmd = { "Browse" },
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
      event = on_some_buffer,
  },

  -- Icons
  'kyazdani42/nvim-web-devicons',

  -- Status Line and Bufferline
  {
      'akinsho/bufferline.nvim',
      branch = 'main',
      config = function() require('settings.plugins.bufferline').setup() end,
      lazy = false,
  },
  -- hide all buffers that doesn't belong to current tab from bufferline
  {
      'tiagovla/scope.nvim',
      opts = {},
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
  { 'max397574/better-escape.nvim',
    config = function() require('settings.plugins.better-escape').setup() end,
    tag = 'v1.0.0',
    event = { 'InsertEnter' },
  },
  {
      'famiu/bufdelete.nvim',
      cmd = { 'Bdelete', 'Bwipeout' }
  },
  {
      'kylechui/nvim-surround',
      opts = {},
      event = on_some_buffer,
  },
  -- to uncomment word use gciC inside comment block. Here iC is treesitter comment text object
  {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      event = on_some_buffer,
  },
  {
      'AckslD/nvim-neoclip.lua',
      dependencies = 'nvim-telescope/telescope.nvim',
      config = function() require('settings.plugins.neoclip').setup() end,
      event = on_some_buffer,
  },
  { 'phaazon/hop.nvim', opts = {} },

  -- building
  {
    'cdelledonne/vim-cmake',
    cmd = { 'CMakeOpen', 'CMakeClose', 'CMakeGenerate', 'CMakeBuild', 'CMakeSwitch', 'CMakeClean' },
  },
  -- use { 'Shatur/neovim-cmake', config = function() require('cmake').setup({}) end }
  {
      'stevearc/overseer.nvim',
      config = function() require('settings.plugins.overseer').setup() end,
      event = { 'VeryLazy' },
  },

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
    ft = { 'c', 'cpp', 'cmake', 'cuda' },
    dependencies = 'williamboman/mason.nvim'
  },
  {
      'SmiteshP/nvim-navic',
      config = function() require('settings.plugins.nvim-navic').setup() end,
  },
  {
      'j-hui/fidget.nvim',
      tag = 'v1.4.0',
      opts = {},
      ft = { 'c', 'cpp', 'cmake', },
  },
  {
      'folke/trouble.nvim',
      dependencies = 'kyazdani42/nvim-web-devicons',
      config = function() require('settings.plugins.trouble').setup() end,
      cmd = 'Trouble',
  },
  { 'kosayoda/nvim-lightbulb', ft = { 'cpp', 'cmake', }, },
  {
      'Badhi/nvim-treesitter-cpp-tools',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      config = function() require('settings.plugins.nvim-treesitter-cpp-tools').setup() end,
      ft = 'cpp',
  },
  { 'p00f/clangd_extensions.nvim', ft = { 'c', 'cpp' }, },
  {
      "jmacadie/telescope-hierarchy.nvim",
      dependencies = { "nvim-telescope/telescope.nvim" },
      keys = {
          { -- lazy style key map
              -- Choose your own keys, this works for me
              "<leader>Lic",
              "<cmd>Telescope hierarchy incoming_calls<cr>",
              desc = "LSP: [S]earch [I]ncoming Calls",
          },
          {
              "<leader>Loc",
              "<cmd>Telescope hierarchy outgoing_calls<cr>",
              desc = "LSP: [S]earch [O]utgoing Calls",
          },
      },
      opts = {
          -- don't use `defaults = { }` here, do this in the main telescope spec
          extensions = {
              hierarchy = {
                  -- telescope-hierarchy.nvim config, see below
              },
              -- no other extensions here, they can have their own spec too
          },
      },
      config = function(_, opts)
          -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
          -- configs for us. We won't use data, as everything is in it's own namespace (telescope
          -- defaults, as well as each extension).
          require("telescope").setup(opts)
          require("telescope").load_extension("hierarchy")
      end,
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    config = function() require('settings.snippets') end,
    ft = { 'cpp', 'cmake', },
  },

  -- Autocomplete
  { 'windwp/nvim-autopairs', opts = {} },
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

  -- Private plugins
  {
      import = 'private.plugins',
      cond = function()
          local status = pcall(require, 'private.plugins')
          return status
      end
  }
}

require('lazy').setup(plugins, lazy_options)
