# set PATH /home/travis/.npm-global/bin $PATH
set PATH /Users/t.shears/Library/Python/3.7/bin $PATH
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x EDITOR "/usr/local/bin/vim"
# alias tmuxc "env TERM=xterm-256color tmux" 
alias rmi "rm -i"
alias mvi "mv -i"
alias l "ls -la"
alias q "exit"
alias f "vim (fzf)"
alias e "eval (docker-machine env club)"

set -U FZF_LEGACY_KEYBINDINGS 0


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t.shears/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/t.shears/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/t.shears/Downloads/google-cloud-sdk/path.fish.inc'; end; end
