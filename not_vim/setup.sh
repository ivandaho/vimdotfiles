# karabiner
# TODO
# mkdir -p  ~/.config/karabiner
# rm -rf ~/.config/karabiner
# ln -s ~/.config/nvim/not_vim/karabiner/ ~/.config

# alacritty
ln -F -s ~/.config/nvim/not_vim/.alacritty.toml ~/.alacritty.toml

# git
ln -F -s ~/.config/nvim/not_vim/.gitconfig ~/.gitconfig

# tig
ln -F -s ~/.config/nvim/not_vim/.tigrc ~/.tigrc

# tmux
ln -F -s ~/.config/nvim/not_vim/.tmux.conf ~/.tmux.conf

# fish
mkdir -p  ~/.config/fish
ln -F -s ~/.config/nvim/not_vim/config.fish ~/.config/fish/config.fish

# sketchybar
mkdir -p  ~/.config/sketchybar/plugins
ln -F -s ~/.config/nvim/not_vim/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
ln -F -s ~/.config/nvim/not_vim/sketchybar/plugins/yabai.sh ~/.config/sketchybar/plugins/yabai.sh
