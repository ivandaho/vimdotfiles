A repo of the setup I use.

### see [vimrc](https://github.com/ivandaho/vimdotfiles/blob/master/vimrc) for list of plugins and more info


### Others:

[gnome-terminal-colors](https://github.com/metalelf0/gnome-terminal-colors)


# Instructions:
* clone to ~/.vim on Linux/MacOS, C:/Users/username/vimfiles on Windows
* `:PlugInstall` inside vim

# Super fast and responsive vim setup with fzf + ripgrep

Kitty is a GPU accelerated terminal emulator. Great if you want a very
responsive vim.

* Install [fzf](https://github.com/junegunn/fzf/),
  [fzf.vim](https://github.com/junegunn/fzf.vim) and
[ripgrep](https://github.com/BurntSushi/ripgrep)

* make sure to configure fzf to use rg in your .bashrc or .bash\_profile


* Install [Kitty](https://sw.kovidgoyal.net/kitty/)

# Specifics:

#### Fonts

* Terminal Vim on Ubuntu is Ubuntu Mono size 13 from
  [here](https://github.com/powerline/fonts/tree/master/UbuntuMono)

* Windows gVim is DejaVuSansMono size 10 from
  [here](https://github.com/powerline/fonts/tree/master/DejaVuSansMono)

* Mac OSX MacVim is Fira Code size 11 from
  [here](https://github.com/tonsky/FiraCode)

For Ubuntu terminal Vim, add to .bashrc:
```
source
"$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
```
# Others:

#### eslint:

```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```
