let g:cmake_build_dir_location = ".build"
let g:cmake_link_compile_commands = 1

augroup vim-cmake-group
    autocmd!
    autocmd User CMakeBuildSucceeded CMakeClose
    autocmd User CMakeBuildFailed CMakeClose
    autocmd User CMakeBuildFailed :Trouble quickfix
augroup END
