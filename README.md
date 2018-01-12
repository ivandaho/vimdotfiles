A repo of the setup I use.

### Bundled:

[CamelCaseMotion](https://github.com/bkad/camelcasemotion)

[ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)

[Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim)

[gruvbox](https://github.com/morhetz/gruvbox/)

[lightline.vim](https://github.com/itchyny/lightline.vim)

[supertab](https://github.com/ervandew/supertab)

[vim-commentary](https://github.com/tpope/vim-commentary)

[vim-dispatch](https://github.com/tpope/vim-dispatch)

[vim-eunuch](https://github.com/tpope/vim-eunuch)

[vim-fugitive](https://github.com/tpope/vim-fugitive)

[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

[vim-jsx](https://github.com/mxw/vim-jsx)

[vim-less](https://github.com/groenewege/vim-less)

[vim-repeat](https://github.com/tpope/vim-repeat)

[vim-sneak](https://github.com/justinmk/vim-sneak)

[vim-surround](https://github.com/tpope/vim-surround)

### Others:

[gnome-terminal-colors](https://github.com/metalelf0/gnome-terminal-colors)


# Instructions:
* clone to ~/.vim on Linux/MacOS, C:/Users/username/vimfiles on Windows
* `git submodule init`
* `git submodule update`
* `git submodule foreach git pull origin master` to update to latest regardless of this repo's specific versions
* see vimrc for more info

# Specifics:

#### Fonts

* Terminal Vim on Ubuntu is Ubuntu Mono size 13 from [here](https://github.com/powerline/fonts/tree/master/UbuntuMono)

* Windows gVim is DejaVuSansMono size 10 from [here](https://github.com/powerline/fonts/tree/master/DejaVuSansMono)

* Mac OSX MacVim is DejaVuSansMono size 11 from [here](https://github.com/tonsky/FiraCode)

For Ubuntu terminal Vim, add to .bashrc:
~~~
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
~~~
#### gnome-terminal-colors (Gruvbox)

(located in /morestuff)

get dconf with:
~~~
sudo apt-get install dconf-cli
~~~
then run installation after creating new terminal profile
~~~
./install.sh
~~~

# Others:

#### eslint:

~~~
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
~~~

#### deoplete:
I have tried [deoplete](https://github.com/Shougo/deoplete.nvim) but I found
that the installation process is not straightforward, and also it is not
performant enough for my liking. I also replaced vim-airline with
lightline.vim for performance reasons. However, the fuzzy completion works well
and I enable it occasionally when I feel that fuzzy completion will give me
better productivity.
