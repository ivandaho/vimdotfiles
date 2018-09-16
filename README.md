A repo of the setup I use.

### infect with [vim-pathogen](https://github.com/tpope/vim-pathogen):

[CamelCaseMotion](https://github.com/bkad/camelcasemotion)

[ale](https://github.com/w0rp/ale)

[Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim)

[fzf](https://github.com/junegunn/fzf/),
[fzf.vim](https://github.com/junegunn/fzf.vim) and then
[ripgrep](https://github.com/BurntSushi/ripgrep)

[gruvbox](https://github.com/morhetz/gruvbox/)

[lightline.vim](https://github.com/itchyny/lightline.vim)

[supertab](https://github.com/ervandew/supertab)

[vim-commentary](https://github.com/tpope/vim-commentary)

[vim-dispatch](https://github.com/tpope/vim-dispatch)

[vim-eunuch](https://github.com/tpope/vim-eunuch)

[vim-fugitive](https://github.com/tpope/vim-fugitive)

[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

[vim-javascript](https://github.com/pangloss/vim-javascript)

[vim-jsx](https://github.com/mxw/vim-jsx)

[vim-less](https://github.com/groenewege/vim-less)

[vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars)

[vim-repeat](https://github.com/tpope/vim-repeat)

[vim-sneak](https://github.com/justinmk/vim-sneak)

[vim-speeddating](https://github.com/tpope/vim-speeddating)

[vim-surround](https://github.com/tpope/vim-surround)

### Others:

[gnome-terminal-colors](https://github.com/metalelf0/gnome-terminal-colors)


# Instructions:
* clone to ~/.vim on Linux/MacOS, C:/Users/username/vimfiles on Windows
* `git submodule init`
* `git submodule update`
* `git submodule foreach git pull origin master` to update to latest regardless
  of this repo's specific versions
* see vimrc for more info

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
