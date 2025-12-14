# Project Structure

This project contains a collection of dotfiles managed by `chezmoi`. The repository is structured to reflect the organization of configuration files in a user's home directory.

## Top-Level Files

- **`dot_bash_aliases`**: Contains shell aliases for `bash`.
- **`dot_bashrc`**: The main configuration file for `bash`.
- **`dot_clang-format`**: Configuration for `clang-format`, a code formatting tool.
- **`dot_lesskey`**: Key bindings for the `less` command.
- **`dot_profile.tmpl`**: A template for the user's shell profile, managed by `chezmoi`.
- **`.chezmoi.toml.tmpl`**: `chezmoi` configuration template.
- **`.chezmoiignore`**: Files and patterns for `chezmoi` to ignore.

## Directory Structure

### Neovim

- **`dot_config/exact_nvim/lua/settings/filetypes.lua`**: Custom filetype associations for Neovim.
- **`dot_config/exact_nvim/lua/settings/init.lua`**: Initialization script that loads other settings modules.
- **`dot_config/exact_nvim/lua/settings/lsp.lua`**: LSP configuration for clangd and cmake language servers.
- **`dot_config/exact_nvim/lua/settings/options.lua`**: General Neovim editor options and settings.
- **`dot_config/exact_nvim/lua/settings/snippets.lua`**: Code snippet definitions for C++ and Google Test.
- **`dot_config/exact_nvim/lua/keymaps.lua`**: Custom key mappings.
- **`dot_config/exact_nvim/lua/plugins.lua`**: Plugin management.
- **`dot_config/exact_nvim/init.lua`**: Extensive configuration for Neovim, a text editor.

### Powerline

- **`dot_config/powerline/`**: Configuration for `powerline`, a status line plugin for shell and other applications.
- **`dot_config/powerline/colorschemes/tmux/`**: `tmux` configuration for `powerline`

### Various

- **`dot_config/exact_alacritty`**: Configuration for `alacritty`, a terminal emulator.
- **`dot_ccache/ccache.conf.tmpl`**: Template for `ccache` configuration, a compiler cache.
- **`dot_config/btop/btop.conf`**: Configuration for `btop`, a resource monitor.
- **`dot_config/clangd/config.yaml`**: Configuration for `clangd`, a language server for C++.
- **`dot_config/mc/`**: Configuration for Midnight Commander `mc`, a file manager.
- **`dot_config/vivid/`**: Themes and filetype definitions for `vivid`, a colorizer for `ls`.
- **`dot_config/starship.toml`**: Configuration for `starship`, a cross-shell prompt.
- **`dot_config/tmux/tmux.conf`**: Configuration for `tmux`, a terminal multiplexer.
- **`dot_config/vivid/filetypes.yml`**: Themes and filetype definitions for `vivid`, a colorizer for `ls`.

### Scripts

- **`dot_local/bin/executable_bootstrap.sh.tmpl`**: A template for a bootstrap script.
- **`dot_local/bin/executable_distcc-wrapper`**: A wrapper script for distcc.
- **`dot_local/bin/executable_distccctl`**: A script to control distcc.
- **`dot_local/bin/executable_google-chrome-stable.sh`**: A script to run Google Chrome.
- **`dot_local/bin/executable_lchezmoi`**: A script for local chezmoi operations.
