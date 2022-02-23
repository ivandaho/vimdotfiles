A repo of the setup I use, including some other non vim dotfiles. I work mostly
with React & TypeScript

### [more info](https://github.com/ivandaho/vimdotfiles/blob/master/vimrc)

# Instructions

- clone to ~/.config/nvim

- `:PlugInstall` inside vim
- link nvim coc-settings.json to ~/.vim/coc-settings.json if needed

# fzf with ripgrep

- Install [fzf](https://github.com/junegunn/fzf/),
  [fzf.vim](https://github.com/junegunn/fzf.vim) and use
  [ripgrep](https://github.com/BurntSushi/ripgrep)

- make sure to configure fzf to use rg in your .bashrc or .bash_profile

# Increased Performance

- Install [Kitty](https://sw.kovidgoyal.net/kitty/) or
  [Alacritty](https://github.com/alacritty/alacritty)

# Others

Ligature Enabled Font: Fira Code size 11 from
[here](https://github.com/tonsky/FiraCode)

[bat](https://github.com/sharkdp/bat) and
[delta](https://github.com/dandavison/delta) for better syntax highlighting in fzf preview window and git diff

- fish shell
  - fisher
	- `fisher install edc/bass`
	- nvm with bass with fisher

- not_vim/setup.sh is there for convenience
- karabiner.json requires exact `product_id`, tweak as necessary 834 is 14"
	mbp, 835 is 16" mbp
