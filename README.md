A repo of the setup I use.

[ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)  
[gruvbox](https://github.com/morhetz/gruvbox/)  
[supertab](https://github.com/ervandew/supertab)  
[syntastic](https://github.com/scrooloose/syntastic)  
[vim-airline](https://github.com/vim-airline/vim-airline)  
[vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)  
[vim-commentary](https://github.com/tpope/vim-commentary)  
[vim-dispatch](https://github.com/tpope/vim-dispatch)  
[vim-fugitive](https://github.com/tpope/vim-fugitive)  
[vim-gitgutter](https://github.com/airblade/vim-gitgutter)  
[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)  
[vim-instant-markdown](https://github.com/suan/vim-instant-markdown)  
[vim-less](https://github.com/groenewege/vim-less)  
[vim-repeat](https://github.com/tpope/vim-repeat)  
[vim-surround](https://github.com/tpope/vim-surround)  
[gnome-terminal-colors](https://github.com/metalelf0/gnome-terminal-colors)  
# Instructions:
* clone to ~/.vim
* see vimrc for more info

# Specifics:



### vim-airline

install prepatched fonts, set terminal font (edit -> profile preferences)

#### Gruvbox for Ubuntu Gnome Terminal Vim
Font is Ubuntu Mono size 13 from [here](https://github.com/powerline/fonts/tree/master/UbuntuMono)

add to .bashrc:
~~~
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
~~~
#### gnome-terminal-colors (Gruvbox)

get dconf with:
~~~
sudo apt-get install dconf-cli
~~~
then run installation after creating new terminal profile
~~~
./install.sh
~~~

### Instant Markdown:

~~~
sudo npm -g install instant-markdown-d
sudo npm -g install xdg-utils
sudo npm -g install curl
~~~
