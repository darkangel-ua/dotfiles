local cb = require'diffview.config'.diffview_callback
local M = {}

local commit_requested = false

function M.commit()
    commit_requested = true
    vim.cmd('Git commit')
end

function M.buf_enter()
    if not commit_requested then return end
    commit_requested = false
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>K", true, false, true), 'n', true)
end

require('diffview').setup {
  key_bindings = {
    view = {
      ["<leader>x"] = ':DiffviewClose<cr>',
    },
    file_panel = {
      ["<leader>x"] = ':DiffviewClose<cr>',
      ["go"] = cb('focus_entry'),
      ["cc"] = ':lua require("settings.diffview").commit()<cr>',
    }
  }
}

vim.cmd[[
augroup my_diffview
    autocmd!
    autocmd BufEnter * lua require('settings.diffview').buf_enter()
augroup END
]]

return M
