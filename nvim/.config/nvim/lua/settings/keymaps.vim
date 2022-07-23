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
