# remove greeting
if status is-interactive
    set fish_greeting
end

set -l os (uname)
if test "$os" = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"

    set -x LIBRARY_PATH $LIBRARY_PATH "/opt/homebrew/lib/"
    set -x C_INCLUDE_PATH $C_INCLUDE_PATH "/opt/homebrew/include/"
    set -x CPLUS_INCLUDE_PATH $CPLUS_INCLUDE_PATH "/opt/homebrew/include/"

    set -x LIBRARY_PATH $LIBRARY_PATH "/opt/homebrew/Cellar/sfml/2.6.1/lib/"
    set -x CPLUS_INCLUDE_PATH $CPLUS_INCLUDE_PATH "/opt/homebrew/Cellar/sfml/2.6.1/include/"
else if test "$os" = Linux
    # stuff for linux
else
    # stuff for both
end

if test $TERM_PROGRAM = iTerm.app
    if status is-interactive
    and not set -q TMUX
        exec tmux new-session -As home
    end
end


set -x XDG_CONFIG_HOME $HOME/.config

# aliases
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias local_ip "ipconfig getifaddr en0"
alias nv "nvim"
alias lg "lazygit"
alias lzd "lazydocker"
alias cat "bat"

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd "$cwd"
	end
	rm -f -- "$tmp"
end

set -x BAT_THEME "base16"

# nodejs
set --universal nvm_default_version v22.2.0

# golang
set -x GOROOT $HOME/.gobrew/current/go
set -x GOPATH $HOME/.gobrew/packages
fish_add_path $HOME/.gobrew/current/bin $HOME/.gobrew/bin $GOPATH/bin

# java
set -x SDKMAN_DIR $HOME/.sdkman

# rust
fish_add_path $HOME/.cargo/bin

# haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/tymofiikliuiev/.ghcup/bin # ghcup-env

fish_add_path $HOME/Other/bin
fish_add_path /opt/homebrew/bin

# python
fish_add_path $HOME/.rye/shims

set -gx EDITOR nvim

set -g mouse on

fzf --fish | source
zoxide init --cmd cd fish | source
starship init fish | source


fish_add_path /Users/tymofiikliuiev/.spicetify
