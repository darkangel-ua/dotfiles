" General movement and editing mappings
" stupid way to close current buffer
nnoremap <silent> <leader>x :bd<cr>
" even more stupid way to close tab
nnoremap <silent> <leader>X :tabc<cr>
" Set kj/jk to be escape in insert mode
inoremap kj <esc>
inoremap jk <esc>
tnoremap kj <C-\><C-N>
tnoremap jk <C-\><C-N>
" same for command mode
" this strange <c-u><bs> is because of some vi compatibility
" see https://stackoverflow.com/questions/24396516/remapping-a-key-to-esc-doesnt-work-in-command-mode
cnoremap kj <c-u><bs>
cnoremap jk <c-u><bs>
" use Ctrl with j and k for command scrolling in command mode
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
" Ctrl j and k for page up and page down
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
" lets make saving convenient
nnoremap <silent> <C-s> :update<cr>
inoremap <silent> <C-s> <C-o>:update<cr>
" lets try to use more convenient Alt
nnoremap <A-w> <C-w>
" lets use much easier Alt-p for pasting + register in insert mode
" because I use clipboard+=unnamedplus we will get system wide clipboard paste
inoremap <A-p> <C-r>+
" lets use much easier Alt-r for pasting 0 register in insert mode
inoremap <A-r> <C-r>0
" show clipboard history
nnoremap <silent> <C-P> :Telescope neoclip plus<cr>
inoremap <silent> <C-P> <C-o>:Telescope neoclip plus<cr>
vnoremap <silent> <C-P> :Telescope neoclip plus<cr>
" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <silent> <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
nnoremap <silent> <M-CR> :let v:hlsearch=!v:hlsearch<CR>
" edit file in the same folder as current buffer
nnoremap <leader>e :e <C-R>=expand("%:p:h")<cr>

" Telescope
nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <leader>fF <cmd>lua require('settings.plugins.telescope').find_files_buffer()<cr>
nnoremap <silent> <leader>fd <cmd>lua require('settings.plugins.telescope').dotfiles()<cr>
nnoremap <silent> <leader>fD <cmd>lua require('settings.plugins.telescope').dotfiles_local()<cr>
nnoremap <silent> <leader>fe <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>
nnoremap <silent> <leader>fE <cmd>lua require('settings.plugins.telescope').file_browser_buffer()<cr>
nnoremap <silent> <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <silent> <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <silent> <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> <leader>fs <cmd>lua require("telescope.builtin").live_grep({additional_args = function() return {'--hidden', '--iglob', '!.git/'} end})<cr>
nnoremap <silent> <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <silent> <leader>fW <cmd>lua require('settings.plugins.telescope').grep_string_in_buffer()<cr>
nnoremap <silent> <leader>p <cmd>Telescope resume<cr>
" this is something similar to Ctrl-Tab in most IDEs - to switch between buffers
nnoremap <silent> <leader>j <cmd>lua require('settings.plugins.telescope').quick_buffers()<cr>
nnoremap <silent> S :Telescope spell_suggest<cr>
nnoremap <silent> <leader>fm <cmd>Telescope man_pages<cr>

" projects
nnoremap <silent> <leader>fp :Telescope projects<cr>

" buffline
nnoremap <silent> <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent> <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent> <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent> <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent> <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent> <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent> <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent> <leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent> <leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" git
nnoremap <silent> <leader>gg :DiffviewOpen<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gch :Telescope git_branches<cr>
nnoremap <silent> <leader>gb :Git blame<cr>

" lsp
nnoremap <silent> gd :lua require('settings.plugins.telescope').lsp_definitions()<cr>
nnoremap <silent> gi :Telescope lsp_implementations<cr>
vnoremap <silent> gi :TSCppDefineClassFunc<cr>
nnoremap <silent> gr <cmd>lua require('settings.plugins.telescope').lsp_references()<cr>
nnoremap <silent> gh :ClangdSwitchSourceHeader<cr>
nnoremap <silent> ga :CodeActionMenu<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>o <cmd>lua require('settings.plugins.telescope').lsp_document_symbols()<cr>
nnoremap <silent> gs <cmd>lua require('settings.plugins.telescope').lsp_dynamic_workspace_symbols()<cr>
vnoremap <silent> <C-f> :lua vim.lsp.buf.range_formatting()<cr>
nnoremap <silent> <C-f> va{ \| :lua vim.lsp.buf.range_formatting()<cr>

" troubles
nnoremap <silent> <leader>a :TroubleToggle document_diagnostics<cr>
nnoremap <silent> <leader>; :TroubleToggle quickfix<cr>:CMakeClose<cr>

" building
nnoremap <silent> <leader>mm :TroubleClose<cr> \| :CMakeBuild<cr>
nnoremap <silent> <leader>mo <cmd>lua require('settings.plugins.ide').cmake_open()<cr>
nnoremap <silent> <leader>mc :CMakeClose<cr>
nnoremap <silent> <leader>mt :lua require('settings.plugins.cmake').select_build_targets()<cr>

" debugging
nnoremap <silent> <F5> :lua require("dap").continue()<cr>
nnoremap <silent> <F8> :lua require("dap").step_over()<cr>
nnoremap <silent> <F9> :lua require("dap").step_into()<cr>
nnoremap <silent> <F21> :lua require("dap").step_out()<cr>          " F21 is actually Shift-F9
nnoremap <silent> <F2> :lua require("dap").toggle_breakpoint()<cr>
nnoremap <silent> <F22> :lua require("dap").terminate()<cr>         " F22 is actually Shift-F10

" reloading config/files
nnoremap <silent> <leader>rc :lua require('settings.reload').reload_all()<cr>
nnoremap <silent> <leader>rf :lua require('settings.reload').source_current_file()<cr>

" ide like behaviour to close support windows by esc leaving only main window
nnoremap <silent> <esc> <cmd>lua require('settings.plugins.ide').on_esc_pressed()<cr>

" scratch terminal
nnoremap <silent> <C-h> <cmd>lua require('FTerm').toggle()<cr>
tnoremap <silent> <C-h> <cmd>lua require('FTerm').toggle()<cr>

" vim tmux integration
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

" hop
nnoremap <silent> s <cmd>HopWord<cr>
vnoremap <silent> s <cmd>HopWord<cr>
nnoremap <silent> <leader>s <cmd>:HopLine<cr>
vnoremap <silent> <leader>s <cmd>HopLine<cr>

" command history
nnoremap <silent> <leader>fc :Telescope command_history<cr>

