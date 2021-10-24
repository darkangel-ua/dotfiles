let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = ':'
let airline#extensions#nvimlsp#warning_symbol = '⚠ :'
let g:airline_theme='base16_gruvbox_dark_hard'

function! LspCurrentFunction() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return get(b:, 'lsp_current_function', '')
  endif
  return ''
endfunction

function! LspProgress() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
      return luaeval("require('lsp-status/statusline').progress()")
  endif
  return ''
endfunction

function! AirlineInit()
  call airline#parts#define_function('lsp_current_function', 'LspCurrentFunction')
  call airline#parts#define_function('lsp_progress', 'LspProgress')
let g:airline_section_x = airline#section#create_right(['lsp_current_function', 'lsp_progress', 'filetype'])
endfunction

autocmd User AirlineAfterInit call AirlineInit()
