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
keymap('n', '<C-P>', ":Telescope neoclip plus<cr>", { desc ='' })
keymap('i', '<C-P>', "<C-o>:Telescope neoclip plus<cr>", { desc ='' })
keymap('v', '<C-P>', ":Telescope neoclip plus<cr>", { desc ='' })

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc ='' })
keymap('n', '<leader>fF', "<cmd>lua require('settings.plugins.telescope').find_files_buffer()<cr>", { desc ='' })
keymap('n', '<leader>fd', "<cmd>lua require('settings.plugins.telescope').dotfiles()<cr>", { desc ='' })
keymap('n', '<leader>fD', "<cmd>lua require('settings.plugins.telescope').dotfiles_local()<cr>", { desc ='' })
keymap('n', '<leader>fe', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", { desc ='' })
keymap('n', '<leader>fE', "<cmd>lua require('settings.plugins.telescope').file_browser_buffer()<cr>", { desc ='' })
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').git_files()<cr>", { desc ='' })
keymap('n', '<leader>fo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc ='' })
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc ='' })
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc ='' })
keymap('n', '<leader>fs', "<cmd>lua require('telescope.builtin').live_grep({additional_args = function() return {'--hidden', '--iglob', '!.git/'} end})<cr>", { desc ='' })
keymap('n', '<leader>fw', "<cmd>lua require('telescope.builtin').grep_string()<cr>", { desc ='' })
keymap('n', '<leader>fW', "<cmd>lua require('settings.plugins.telescope').grep_string_in_buffer()<cr>", { desc ='' })
keymap('n', '<leader>p', "<cmd>Telescope resume<cr>", { desc ='' })
keymap('n', 'S', ":Telescope spell_suggest<cr>", { desc ='' })
keymap('n', '<leader>fm', "<cmd>Telescope man_pages<cr>", { desc ='' })

-- projects
keymap('n', '<leader>fp', ':Telescope projects<cr>', { desc = 'Find a project' })

-- buffers
keymap('n', '<leader>1', "<Cmd>lua require('bufferline').go_to(1, true)<cr>", { desc ='' })
keymap('n', '<leader>2', "<Cmd>lua require('bufferline').go_to(2, true)<cr>", { desc ='' })
keymap('n', '<leader>3', "<Cmd>lua require('bufferline').go_to(3, true)<cr>", { desc ='' })
keymap('n', '<leader>4', "<Cmd>lua require('bufferline').go_to(4, true)<cr>", { desc ='' })
keymap('n', '<leader>5', "<Cmd>lua require('bufferline').go_to(5, true)<cr>", { desc ='' })
keymap('n', '<leader>6', "<Cmd>lua require('bufferline').go_to(6, true)<cr>", { desc ='' })
keymap('n', '<leader>7', "<Cmd>lua require('bufferline').go_to(7, true)<cr>", { desc ='' })
keymap('n', '<leader>8', "<Cmd>lua require('bufferline').go_to(8, true)<cr>", { desc ='' })
keymap('n', '<leader>9', "<Cmd>lua require('bufferline').go_to(9, true)<cr>", { desc ='' })
keymap('n', '<leader>0', ":BufferLineTogglePin<cr> <bar> :lua require('bufferline').sort_by('none')<cr>", { desc ='' })
-- this is something similar to Ctrl-Tab in most IDEs - to switch between buffers
keymap('n', '<leader>j', "<cmd>lua require('settings.plugins.telescope').quick_buffers()<cr>", { desc ='' })

-- git
keymap('n', '<leader>gg', ":DiffviewOpen<cr>", { desc ='' })
keymap('n', '<leader>gG', ":DiffviewOpen develop..HEAD<cr>", { desc ='' })
keymap('n', '<leader>gd', ":Gdiff<cr>", { desc ='' })
keymap('n', '<leader>gch', ":Telescope git_branches<cr>", { desc ='' })
keymap('n', '<leader>gb', ":Git blame<cr>", { desc ='' })

-- lsp
keymap('n', 'gd', ":lua require('settings.plugins.telescope').lsp_definitions()<cr>", { desc ='' })
keymap('n', 'gD', ":Telescope lsp_type_definitions<cr>", { desc ='' })
keymap('n', 'gi', ":Telescope lsp_implementations<cr>", { desc ='' })
keymap('v', 'gi', ":TSCppDefineClassFunc<cr>", { desc ='' })
keymap('n', 'gr', "<cmd>lua require('settings.plugins.telescope').lsp_references()<cr>", { desc ='' })
keymap('n', 'gh', ":ClangdSwitchSourceHeader<cr>", { desc ='' })
keymap('n', 'ga', ":CodeActionMenu<cr>", { desc ='' })
keymap('n', 'K', ":lua vim.lsp.buf.hover()<CR>", { desc ='' })
keymap('n', '<leader>rn', ":lua vim.lsp.buf.rename()<CR>", { desc ='' })
keymap('n', '<leader>o', "<cmd>lua require('settings.plugins.telescope').lsp_document_symbols()<cr>", { desc ='' })
keymap('n', 'gs', "<cmd>lua require('settings.plugins.telescope').lsp_dynamic_workspace_symbols()<cr>", { desc ='' })
keymap('v', '<C-f>', ":lua vim.lsp.buf.range_formatting()<cr>", { desc ='' })
keymap('n', '<C-f>', "va{ <bar> :lua vim.lsp.buf.range_formatting()<cr>", { desc ='' })

-- troubles
keymap('n', '<leader>a', ":TroubleToggle document_diagnostics<cr>", { desc ='' })
keymap('n', '<leader>;', ":TroubleToggle quickfix<cr>:CMakeClose<cr>", { desc ='' })

-- building
keymap('n', '<leader>mm', ":TroubleClose<cr> <bar> :CMakeBuild<cr>", { desc ='' })
keymap('n', '<leader>mo', "<cmd>lua require('settings.plugins.ide').cmake_open()<cr>", { desc ='' })
keymap('n', '<leader>mc', ":CMakeClose<cr>", { desc ='' })
keymap('n', '<leader>mt', ":lua require('settings.plugins.cmake').select_build_targets()<cr>", { desc ='' })

-- debugging
keymap('n', '<F5>', ":lua require('dap').continue()<cr>", { desc ='' })
keymap('n', '<F8>', ":lua require('dap').step_over()<cr>", { desc ='' })
keymap('n', '<F9>', ":lua require('dap').step_into()<cr>", { desc ='' })
keymap('n', '<F21>', ":lua require('dap').step_out()<cr>", { desc ='' }) -- F21 is actually Shift-F9
keymap('n', '<F2>', ":lua require('dap').toggle_breakpoint()<cr>", { desc ='' })
keymap('n', '<F22>', ":lua require('dap').terminate()<cr>", { desc ='' }) -- F22 is actually Shift-F10

-- reloading config/files
keymap('n', '<leader>rc', ":lua require('settings.reload').reload_all()<cr>", { desc ='' })
keymap('n', '<leader>rf', ":lua require('settings.reload').source_current_file()<cr>", { desc ='' })

-- ide like behaviour to close support windows by esc leaving only main window
keymap('n', '<esc>', "<cmd>lua require('settings.plugins.ide').on_esc_pressed()<cr>", { desc ='' })

-- scratch terminal
keymap('n', '<C-h>', "<cmd>lua require('FTerm').toggle()<cr>", { desc ='' })
keymap('t', '<C-h>', "<cmd>lua require('FTerm').toggle()<cr>", { desc ='' })

-- vim tmux integration
keymap('n', '<A-h>', ':TmuxNavigateLeft<cr>', { desc ='' })
keymap('n', '<A-j>', ':TmuxNavigateDown<cr>', { desc ='' })
keymap('n', '<A-k>', ':TmuxNavigateUp<cr>', { desc ='' })
keymap('n', '<A-l>', ':TmuxNavigateRight<cr>', { desc ='' })

-- hop
keymap('n', 's', '<cmd>HopWord<cr>', { desc ='' })
keymap('v', 's', '<cmd>HopWord<cr>', { desc ='' })
keymap('n', '<leader>s', '<cmd>:HopLine<cr>', { desc ='' })
keymap('v', '<leader>s', '<cmd>HopLine<cr>', { desc ='' })

-- command history
keymap('n', '<leader>fc', ':Telescope command_history<cr>', { desc ='' })

local M = {}

function M.dashboard()
    keymap('n', 'O', ':SessionManager load_session<cr>', { buffer = true })
    keymap('n', 'S', ':SessionManager load_last_session<cr>', { buffer = true })
    keymap('n', 'C', ':SessionManager load_current_dir_session<cr>', { buffer = true })
    keymap('n', 'o', ":lua require('telescope.builtin').oldfiles()<cr>", { buffer = true })
    keymap('n', 's', ":lua require('settings.plugins.telescope').dotfiles()<cr>", { buffer = true })
    keymap('n', 'q', ':q<cr>', { buffer = true })
end

return M

