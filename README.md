A repo of the setup I use, including some other non vim dotfiles. I work mostly
with React & TypeScript

### [more info](https://github.com/ivandaho/vimdotfiles/blob/master/vimrc)

# Instructions

- clone to ~/.vim on Linux/MacOS, C:/Users/username/vimfiles on Windows
- have this in ~/.config/nvim/init.vim:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
```

- `:PlugInstall` inside vim
- link nvim coc-settings.json to ~/.vim/coc-settings.json if needed

# fzf with ripgrep

- Install [fzf](https://github.com/junegunn/fzf/),
  [fzf.vim](https://github.com/junegunn/fzf.vim) and use
  [ripgrep](https://github.com/BurntSushi/ripgrep)

- make sure to configure fzf to use rg in your .bashrc or .bash_profile

# Increased Performance

Kitty and Alacritty are GPU accelerated terminal emulators. Kitty has more
features but Alacritty is faster (as of the time of writing). The performance
difference will be noticable with complex syntax highlighting and multiple
plugins. Kitty also supports ligatures while Alacritty does not.

- Install [Kitty](https://sw.kovidgoyal.net/kitty/) or
  [Alacritty](https://github.com/alacritty/alacritty)
- Install [Neovim](https://github.com/neovim/neovim/) - you will need the
  `--HEAD` option for floating windows

# Others:

Ligature Enabled Font: Fira Code size 11 from
[here](https://github.com/tonsky/FiraCode)
