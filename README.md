# dotfiles

## Neovim

To enable the configuration, make a symlink to the init.vim:

```bash
mkdir ~/.config/nvim
ln -s <path-to-this-repo>/.config/nvim/init.vim ~/.config/nvim/init.vim
```

### Plugins

Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug). Run the following command to install it:

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Some plugins need some system dependencies to work correctly.

Telescope needs:
```bash
brew install ripgrep
```

Install LSP servers:
```bash
gem install solargraph
npm install -g typescript typescript-language-server
```

After opening `nvim` for the first time, you need to install the plugins with:

```nvim
:PlugInstall
```

### Leader mappings

Leader key is ","

| Key(s) | Command |
| ------ | ------- |
| fa     | Telescope: Find all (grep) |
| fb     | Telescope: Find buffers |
| ff     | Telescope: Find files |
| fg     | Telescope: Find git files |
| fh     | Telescope: Find help tags |
| fr     | Telescope: Find resume (previous search) |

### Normal mode mappings

| Key(s) | Command |
| ------ | ------- |
| K      | Telescope: Search for the word under the cursor |
