augroup chezmoi
    autocmd!
    " from here https://cj.rs/blog/my-setup/chezmoi/
    au BufWritePost ~/.local/share/chezmoi/* silent ! chezmoi apply --source-path %
    au BufWritePost ~/.local/share/chezmoi.local/* silent ! chezmoi apply --source-path %
augroup END
