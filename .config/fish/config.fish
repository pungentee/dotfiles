# remove greeting
if status is-interactive
    set fish_greeting
end

set -l os (uname)
if test "$os" = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"

    set -x LIBRARY_PATH $LIBRARY_PATH "/opt/homebrew/lib/"
    set -x INCLUDE_PATH $INCLUDE_PATH "/opt/homebrew/include/"
else if test "$os" = Linux
    # stuff for linux
else
    # stuff for both
end

# if status is-interactive
# and not set -q TMUX
#     exec tmux new-session -As home
# end

set -x XDG_CONFIG_HOME $HOME/.config

# aliases
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias local_ip "ipconfig getifaddr en0"
alias nv "nvim"
alias lg "lazygit"

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd "$cwd"
	end
	rm -f -- "$tmp"
end

# nodejs
set --universal nvm_default_version v22.2.0

# golang
set -x GOROOT $HOME/.gobrew/current/go
set -x GOPATH $HOME/.gobrew/packages
set -x PATH $HOME/.gobrew/current/bin $HOME/.gobrew/bin $GOPATH/bin $PATH

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
pyenv init - | source

# java
set -x SDKMAN_DIR $HOME/.sdkman

# rust
set -x PATH "$HOME/.cargo/bin" $PATH

set -x PATH "$HOME/Other/bin" $PATH
set -x PATH "$HOME/.local/bin" $PATH

set -gx EDITOR nvim

set -g mouse on

fzf --fish | source
zoxide init --cmd cd fish | source
starship init fish | source



