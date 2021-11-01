local cb = require'diffview.config'.diffview_callback

require('diffview').setup {
  key_bindings = {
    view = {
      ["<leader>x"] = ':DiffviewClose<cr>',
    },
    file_panel = {
      ["<leader>x"] = ':DiffviewClose<cr>',
      ["go"] = cb('focus_entry')
    }
  }
}
