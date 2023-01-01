local keymap = function(mode, lhs, rhs, opts)
    if opts.desc and opts.desc == '' then
        opts.desc = rhs
    end
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', { silent = true, noremap = true }, opts))
end

-- General movement and editing mappings
keymap('n', '<leader>x', function() require('settings.plugins.ide').bufdelete() end, { desc ='' })
-- even more stupid way to close tab
keymap('n', '<leader>X', ":tabc<cr>", { desc ='' })
-- Set kj/jk to be escape in insert mode
keymap('i', 'kj', "<esc>", { desc ='' })
keymap('i', 'jk', "<esc>", { desc ='' })
keymap('t', 'kj', "<C-\\><C-N>", { desc ='' })
keymap('t', 'jk', "<C-\\><C-N>", { desc ='' })
-- same for command mode
-- this strange <c-u><bs> is because of some vi compatibility
-- see https://stackoverflow.com/questions/24396516/remapping-a-key-to-esc-doesnt-work-in-command-mode
keymap('c', 'kj', "<c-u><bs>", { desc ='' })
keymap('c', 'jk', "<c-u><bs>", { desc ='' })
-- use Ctrl with j and k for command scrolling in command mode
keymap('c', '<C-j>', "<C-n>", { desc ='' })
keymap('c', '<C-k>', "<C-p>", { desc ='' })
-- Ctrl j and k for page up and page down
keymap('n', '<C-j>', "<C-d>", { desc ='' })
keymap('n', '<C-k>', "<C-u>", { desc ='' })
keymap('n', '<C-j>', "<C-d>", { desc ='' })
keymap('n', '<C-k>', "<C-u>", { desc ='' })
-- lets make saving convenient
keymap('n', '<C-s>', ":update<cr>", { desc ='' })
keymap('i', '<C-s>', "<C-o>:update<cr>", { desc ='' })
-- lets use much easier Alt-p for pasting + register in insert mode
-- because I use clipboard+=unnamedplus we will get system wide clipboard paste
keymap('i', '<A-p>', "<C-r>+", { desc ='' })
-- lets use much easier Alt-r for pasting 0 register in insert mode
keymap('i', '<A-r>', "<C-r>0", { desc ='' })
-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
keymap('n', '<CR>', '{-> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>"}()', { expr = true })
keymap('n', '<M-CR>', ":let v:hlsearch=!v:hlsearch<CR>", { desc ='' })
-- edit file in the same folder as current buffer
keymap('n', '<leader>e', ":e <C-R>=expand(\"%:p:h\")<cr>", { silent = false, desc ='' })
-- moving parameters back and forth
keymap('n', 'cph', '<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>', { desc = 'Swap parameter left' })
keymap('n', 'cpk', '<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>', { desc = 'Swap parameter left' })
keymap('n', 'cpj', '<cmd>TSTextobjectSwapNext @parameter.inner<cr>', { desc = 'Swap parameter right' })
keymap('n', 'cpl', '<cmd>TSTextobjectSwapNext @parameter.inner<cr>', { desc = 'Swap parameter right' })

-- clipboard
keymap('n', '<C-P>', "<cmd>Telescope neoclip plus<cr>", { desc ='' })
keymap('i', '<C-P>', "<C-o><cmd>Telescope neoclip plus<cr>", { desc ='' })
keymap('v', '<C-P>', "<cmd>Telescope neoclip plus<cr>", { desc ='' })

-- Telescope
keymap('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc ='' })
keymap('n', '<leader>fF', function() require('settings.plugins.telescope').find_files_buffer() end, { desc ='' })
keymap('n', '<leader>fd', function() require('settings.plugins.telescope').dotfiles() end, { desc ='' })
keymap('n', '<leader>fD', function() require('settings.plugins.telescope').dotfiles_local() end, { desc ='' })
keymap('n', '<leader>fe', function() require 'telescope'.extensions.file_browser.file_browser() end, { desc ='' })
keymap('n', '<leader>fE', function() require('settings.plugins.telescope').file_browser_buffer() end, { desc ='' })
keymap('n', '<leader>fg', function() require('telescope.builtin').git_files() end, { desc ='' })
keymap('n', '<leader>fo', function() require('telescope.builtin').oldfiles() end, { desc ='' })
keymap('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc ='' })
keymap('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc ='' })
keymap('n', '<leader>fs', function() require('telescope.builtin').live_grep() end, { desc ='' })
keymap('n', '<leader>fS', function() require('telescope.builtin').live_grep({additional_args = function() return {'--hidden', '--iglob', '!.git/'} end}) end, { desc ='' })
keymap('n', '<leader>fw', function() require('telescope.builtin').grep_string() end, { desc ='' })
keymap('n', '<leader>fW', function() require('settings.plugins.telescope').grep_string_in_buffer() end, { desc ='' })
keymap('n', '<leader>p', "<cmd>Telescope resume<cr>", { desc ='' })
keymap('n', 'S', "<cmd>Telescope spell_suggest<cr>", { desc ='' })
keymap('n', '<leader>fm', "<cmd>Telescope man_pages<cr>", { desc ='' })

-- projects
keymap('n', '<leader>fp', '<cmd>Telescope projects<cr>', { desc = 'Find a project' })

-- buffers
keymap('n', '<leader>1', function() require('bufferline').go_to(1, true) end, { desc ='' })
keymap('n', '<leader>2', function() require('bufferline').go_to(2, true) end, { desc ='' })
keymap('n', '<leader>3', function() require('bufferline').go_to(3, true) end, { desc ='' })
keymap('n', '<leader>4', function() require('bufferline').go_to(4, true) end, { desc ='' })
keymap('n', '<leader>5', function() require('bufferline').go_to(5, true) end, { desc ='' })
keymap('n', '<leader>6', function() require('bufferline').go_to(6, true) end, { desc ='' })
keymap('n', '<leader>7', function() require('bufferline').go_to(7, true) end, { desc ='' })
keymap('n', '<leader>8', function() require('bufferline').go_to(8, true) end, { desc ='' })
keymap('n', '<leader>9', function() require('bufferline').go_to(9, true) end, { desc ='' })
keymap('n', '<leader>0', "<cmd>BufferLineTogglePin<cr> <bar> <cmd>lua require('bufferline').sort_by('none')<cr>", { desc ='' })
-- this is something similar to Ctrl-Tab in most IDEs - to switch between buffers
keymap('n', '<leader>j', "<cmd>lua require('settings.plugins.telescope').quick_buffers()<cr>", { desc ='' })

-- git
keymap('n', '<leader>gg', "<cmd>DiffviewOpen<cr>", { desc ='' })
keymap('n', '<leader>gG', "<cmd>DiffviewOpen develop..HEAD<cr>", { desc ='' })
keymap('n', '<leader>gd', "<cmd>Gdiff<cr>", { desc ='' })
keymap('n', '<leader>gch', "<cmd>Telescope git_branches<cr>", { desc ='' })
keymap('n', '<leader>gb', "<cmd>Git blame<cr>", { desc ='' })
keymap('n', '<leader>gl', "<cmd>Telescope git_commits<cr>", { desc ='' })

-- lsp
keymap('n', 'gd', function() require('settings.plugins.telescope').lsp_definitions() end, { desc ='' })
keymap('n', 'gD', "<cmd>Telescope lsp_type_definitions<cr>", { desc ='' })
keymap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", { desc ='' })
keymap('v', 'gi', "<cmd>TSCppDefineClassFunc<cr>", { desc ='' })
keymap('n', 'gr', function() require('settings.plugins.telescope').lsp_references() end, { desc ='' })
keymap('n', 'gh', "<cmd>ClangdSwitchSourceHeader<cr>", { desc ='' })
keymap('n', 'ga', "<cmd>CodeActionMenu<cr>", { desc ='' })
keymap('n', 'K', vim.lsp.buf.hover, { desc ='' })
keymap('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", { desc ='' })
keymap('n', '<leader>o', function() require('settings.plugins.telescope').lsp_document_symbols() end, { desc ='' })
keymap('n', 'gs', function() require('settings.plugins.telescope').lsp_dynamic_workspace_symbols() end, { desc ='' })
keymap('v', '<C-f>', "<cmd>lua vim.lsp.buf.format()<cr><esc>", { desc ='' })
keymap('n', '<C-f>', "va{<bar><cmd>lua vim.lsp.buf.format()<cr><esc>", { desc ='' })

-- troubles
keymap('n', '<leader>a', "<cmd>TroubleToggle document_diagnostics<cr>", { desc ='' })
keymap('n', '<leader>;', "<cmd>TroubleToggle quickfix<cr><cmd>CMakeClose<cr>", { desc ='' })

-- building
keymap('n', '<leader>mm', "<cmd>TroubleClose<cr> <bar> <cmd>CMakeBuild<cr>", { desc ='' })
keymap('n', '<leader>mo', function() require('settings.plugins.ide').cmake_open() end, { desc ='' })
keymap('n', '<leader>mc', "<cmd>CMakeClose<cr>", { desc ='' })
keymap('n', '<leader>mt', function() require('settings.plugins.cmake').select_build_targets() end, { desc ='' })

-- debugging
keymap('n', '<F5>', function() require('dap').continue() end, { desc ='' })
keymap('n', '<F8>', function() require('dap').step_over() end, { desc ='' })
keymap('n', '<F9>', function() require('dap').step_into() end, { desc ='' })
keymap('n', '<F21>', function() require('dap').step_out() end, { desc ='' }) -- F21 is actually Shift-F9
keymap('n', '<F2>', function() require('dap').toggle_breakpoint() end, { desc ='' })
keymap('n', '<F22>', function() require('dap').terminate() end, { desc ='' }) -- F22 is actually Shift-F10

-- reloading config/files
keymap('n', '<leader>rc', function() require('settings.reload').reload_all() end, { desc ='' })
keymap('n', '<leader>rf', function() require('settings.reload').source_current_file() end, { desc ='' })

-- ide like behaviour to close support windows by esc leaving only main window
keymap('n', '<esc>', function() require('settings.plugins.ide').on_esc_pressed() end, { desc ='' })

-- scratch terminal
keymap('n', '<C-h>', function() require('FTerm').toggle() end, { desc ='' })
keymap('t', '<C-h>', function() require('FTerm').toggle() end, { desc ='' })

-- vim tmux integration
keymap('n', '<A-h>', '<cmd>TmuxNavigateLeft<cr>', { desc ='' })
keymap('n', '<A-j>', '<cmd>TmuxNavigateDown<cr>', { desc ='' })
keymap('n', '<A-k>', '<cmd>TmuxNavigateUp<cr>', { desc ='' })
keymap('n', '<A-l>', '<cmd>TmuxNavigateRight<cr>', { desc ='' })

-- hop
keymap('n', 's', '<cmd>HopWord<cr>', { desc ='' })
keymap('n', '<leader>s', '<cmd>HopLine<cr>', { desc ='' })
-- this is hop powered f/t variants
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
vim.keymap.set('', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {remap=true})

-- command history
keymap('n', '<leader>fc', '<cmd>Telescope command_history<cr>', { desc ='' })

local M = {}

function M.dashboard()
    keymap('n', 'O', '<cmd>SessionManager load_session<cr>', { buffer = true })
    keymap('n', 'S', '<cmd>SessionManager load_last_session<cr>', { buffer = true })
    keymap('n', 'C', '<cmd>SessionManager load_current_dir_session<cr>', { buffer = true })
    keymap('n', 'o', function() require('telescope.builtin').oldfiles() end, { buffer = true })
    keymap('n', 's', function() require('settings.plugins.telescope').dotfiles() end, { buffer = true })
    keymap('n', 'q', ':q<cr>', { buffer = true })
end

return M

