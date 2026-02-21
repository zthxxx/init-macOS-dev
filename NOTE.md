```bash
# scp -R ~/.ssh/* macbook:~/.ssh/

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# tmux
mkdir -p ~/Project/Shell
git clone --depth=1 git@github.com:zthxxx/tmux-config.git ~/Project/Shell/tmux-config
cd ~/Project/Shell/tmux-config
mkdir -p ~/.config/tmux
ln -fs "$(pwd)/tmux.conf" ~/.config/tmux/tmux.conf
```