let g:tmux_navigator_no_mappings = 1
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <C-S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-S-Right> :TmuxNavigateRight<cr>
