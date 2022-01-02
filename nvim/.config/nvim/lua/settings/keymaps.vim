" General movement and editing mappings
" stupid way to close current buffer
nnoremap <silent> <leader>x :bd<cr>
" even more stupid way to close tab
nnoremap <silent> <leader>X :tabc<cr>
" Set kj/jk to be escape in insert mode
inoremap kj <esc>
inoremap jk <esc>
" same for command mode
" this strange <c-u><bs> is because of some vi compatibility
" see https://stackoverflow.com/questions/24396516/remapping-a-key-to-esc-doesnt-work-in-command-mode
cnoremap kj <c-u><bs>
cnoremap jk <c-u><bs>
" use Alt with j and k for command scrolling in command mode
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
" lets make saving convenient
nnoremap <silent> <A-s> :update<cr>
inoremap <silent> <A-s> <C-o>:update<cr>
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
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
nnoremap <silent> <M-CR> :let v:hlsearch=!v:hlsearch<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fF <cmd>lua require('plugins.telescope').find_files_buffer()<cr>
nnoremap <leader>fd <cmd>lua require('plugins.telescope').dotfiles()<cr>
nnoremap <leader>fD <cmd>lua require('plugins.telescope').dotfiles_local()<cr>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fE <cmd>lua require('plugins.telescope').file_browser_buffer()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
" this is something similar to Ctrl-Tab in most IDEs - to switch between buffers
nnoremap <A-j> <cmd>lua require('plugins.telescope').quick_buffers()<cr>

" projects
nnoremap <silent> <leader>fp :Telescope projects <cr>
nnoremap <silent> <leader>fP :lua require('plugins.projects').edit_project_list()<cr>

" buffline
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" git
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gg :DiffviewOpen<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gch :Telescope git_branches<cr>
nnoremap <leader>gb :Git blame<cr>

" lsp
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :Telescope lsp_implementations<cr>
nnoremap <silent> gr <cmd>lua require('plugins.telescope').lsp_references()<cr>
nnoremap <silent> gh :ClangdSwitchSourceHeader<cr>
nnoremap <silent> ga :CodeActionMenu<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>o <cmd>lua require('plugins.telescope').lsp_document_symbols()<cr>
nnoremap <silent> <leader>s <cmd>lua require('plugins.telescope').lsp_dynamic_workspace_symbols()<cr>
vnoremap <silent> <A-f> :lua vim.lsp.buf.range_formatting()<cr>

" troubles
nnoremap <silent> <leader>a :TroubleToggle document_diagnostics<cr>
nnoremap <silent> <leader>; :TroubleToggle quickfix<cr>:CMakeClose<cr>

" building
nnoremap <silent> <leader>mm :CMakeBuild<cr>
nnoremap <silent> <leader>mo :CMakeOpen<cr>
nnoremap <silent> <leader>mc :CMakeClose<cr>

" reloading config/files
nnoremap <silent> <leader>rc :lua require('settings.reload').reload_all()<cr>
nnoremap <silent> <leader>rf :lua require('settings.reload').source_current_file()<cr>

