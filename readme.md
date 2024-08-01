# NeoVim files

## Install on Arch Linux

### Packages

- neovim
- xclip (neovim clipboard capabilities)
- python-pynvim (python client, needed for some plugins)
- go (build hexokinase)
- ripgrep (telescope)
- fg (telescope)
- direnv (direnv)
- ascii-image-converter (image.nvim)
- stylua (for autoformat in order to format this project)
- typos + typos-lsp-bin
- jedi-language-server (for python)

Clone this repository to
~/.config/nvim

Run `install.sh` to install Packer.
Launch `nvim` and run `:PackerSync`, restart `nvim`.
