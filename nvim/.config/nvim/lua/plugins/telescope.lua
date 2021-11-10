local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local utils = require('telescope.utils')

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
                      ['<A-j>'] = actions.move_selection_next,
                      ['<A-k>'] = actions.move_selection_previous,
                      ['<C-j>'] = actions.preview_scrolling_down,
                      ['<C-k>'] = actions.preview_scrolling_up,
                      ['<A-x>'] = actions.close
                  },
              n = {
                      ['<C-C>'] = actions.close,
                      ['<C-j>'] = actions.preview_scrolling_down,
                      ['<C-k>'] = actions.preview_scrolling_up,
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

    builtin.file_browser(opts)
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
        }
    }

    return builtin.lsp_references(opts)
end

function M.lsp_document_symbols()
    local opts = {
      previewer = false,
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
        }
    }

    return builtin.lsp_dynamic_workspace_symbols(opts)
end

return M
