local cb = require'diffview.config'.diffview_callback
local M = {}

require('diffview').setup {
  key_bindings = {
    view = {
      ["<leader>x"] = ':silent DiffviewClose<cr>',
      ["q"] = ':silent DiffviewClose<cr>',
    },
    file_panel = {
      ["<leader>x"] = ':silent DiffviewClose<cr>',
      ["go"] = cb('focus_entry'),
      ["cc"] = ':silent top Git commit<cr>',
      ["q"] = ':silent DiffviewClose<cr>',
    }
  }
}

return M
