local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local utils = require('telescope.utils')
local actions_layout = require('telescope.actions.layout')

local M = {}

function M.setup()
    telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
              prompt_position = "top",
          },
          mappings = {
              i = {
                      ['<C-j>'] = actions.preview_scrolling_down,
                      ['<C-k>'] = actions.preview_scrolling_up,
                      ['<C-p>'] = actions_layout.toggle_preview,
                  },
              n = {
                      ['<C-C>'] = actions.close,
                      ['<C-j>'] = actions.preview_scrolling_down,
                      ['<C-k>'] = actions.preview_scrolling_up,
                      ['<C-p>'] = actions_layout.toggle_preview,
              }
          }
        }
    })
end

function M.quick_buffers()
  local opts = {
      sort_mru = true,
      ignore_current_buffer = true,
      previewer = false,
      layout_config = {
          width = 0.45,
          height = 0.35,
      },
      attach_mappings = function(_, map)
        map('n', 'x', actions.delete_buffer)

        return true
      end
  }

  builtin.buffers(opts)
end

function M.dotfiles()
  local opts = {
      prompt_title = '~ dotfiles ~',
      show_untracked = true,
      cwd = '~/.dotfiles'
  }

  builtin.git_files(opts)
end

function M.dotfiles_local()
  local opts = {
      prompt_title = '~ dotfiles.local ~',
      show_untracked = true,
      cwd = '~/.dotfiles.local'
  }

  builtin.git_files(opts)
end

function M.find_files_buffer()
    local opts = {
        cwd = utils.buffer_dir()
    }

    builtin.find_files(opts)
end

function M.file_browser_buffer()
    local opts = {
        cwd = utils.buffer_dir()
    }

    telescope.extensions.file_browser.file_browser(opts)
end

function M.lsp_references()
    local opts = {
        initial_mode = 'normal',
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99,
            preview_height = 0.7,
            prompt_position = 'top',
            mirror = true,
        },
        fname_width = 50,
    }

    return builtin.lsp_references(opts)
end

function M.lsp_definitions()
    local opts = {
        initial_mode = 'normal',
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99,
            preview_height = 0.7,
            prompt_position = 'top',
            mirror = true,
        }
    }

    return builtin.lsp_definitions(opts)
end

function M.lsp_document_symbols()
    local opts = {
      previewer = false,
      show_line = true,
      symbol_width = 45,
      layout_strategy = 'vertical',
      layout_config = {
          prompt_position = 'top',
          mirror = true,
      }
    }

    builtin.lsp_document_symbols(opts)
end

function M.lsp_dynamic_workspace_symbols()
    local opts = {
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99,
            preview_height = 0.7,
            prompt_position = 'top',
            mirror = true,
        },
        symbol_width = 45,
        fname_width = 50,
    }

    return builtin.lsp_dynamic_workspace_symbols(opts)
end

function M.grep_string_in_buffer()
    local opts = {
        prompt_title = 'Find word in current buffer',
        default_text = vim.fn.expand('<cword>'),
        sorter = require('telescope.sorters').get_substr_matcher({}),
        initial_mode = 'normal',
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99,
            preview_height = 0.7,
            mirror = true,
        }
    }

    builtin.current_buffer_fuzzy_find(opts)
end

return M
