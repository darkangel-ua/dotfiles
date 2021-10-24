local telescope = require('telescope')
local actions = require('telescope.actions')

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

  require('telescope.builtin').buffers(opts);
end

function M.dotfiles()
  local opts = {
      prompt_title = '~ dotfiles ~',
      show_untracked = true,
      cwd = '~/.dotfiles'
  }

  require('telescope.builtin').git_files(opts);
end

function M.dotfiles_local()
  local opts = {
      prompt_title = '~ dotfiles.local ~',
      show_untracked = true,
      cwd = '~/.dotfiles.local'
  }

  require('telescope.builtin').git_files(opts);
end

return M
