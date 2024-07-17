# dotfiles

## Install dependencies

```sh
starship 
neovim 
yazi 
fish 
tmux 
stow 
git 
gcc 
glow
make 
ripgrep 
deno 
zoxide 
fzf 
lazygit 
rye
git-delta
```

## Install dotfiles
```sh
git clone https://github.com/pungentee/dotfiles ~/.dotfiles 
cd ~/.dotfiles 
stow --adopt .
```


## Install SDKs

```sh
# java
sdk install java 17.0.9-graalce

# node
nvm install latest
# change node version in .config/fish/config.fish
# set --universal nvm_default_version v22.3.0

# go
curl -sL https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh
gobrew install latest

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
