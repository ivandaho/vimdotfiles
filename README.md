A repo of the setup I use. I work mostly with React & TypeScript

### see [vimrc](https://github.com/ivandaho/vimdotfiles/blob/master/vimrc) for list of plugins and more info

# Instructions:

- clone to ~/.vim on Linux/MacOS, C:/Users/username/vimfiles on Windows
- have this in ~/.config/nvim/init.vim:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
```

- `:PlugInstall` inside vim
- link nvim coc-settings.json to ~/.vim/coc-settings.json if needed

# Super fast and responsive vim setup with fzf + ripgrep

Kitty is a GPU accelerated terminal emulator. Great if you want a very
responsive vim.

- Install [fzf](https://github.com/junegunn/fzf/),
  [fzf.vim](https://github.com/junegunn/fzf.vim) and
  [ripgrep](https://github.com/BurntSushi/ripgrep)

- make sure to configure fzf to use rg in your .bashrc or .bash_profile

* Install [Kitty](https://sw.kovidgoyal.net/kitty/)
* Install [Neovim](https://github.com/neovim/neovim/) - you will need the
  `--HEAD` option for floating windows

# Others:

Ligature Enabled Font: Fira Code size 11 from
[here](https://github.com/tonsky/FiraCode)

