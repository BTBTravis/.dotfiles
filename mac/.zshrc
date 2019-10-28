# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath=(~/projects/shop/p100/dev_env $fpath)

fpath=(~/ww_dotfiles $fpath)
autoload -Uz _wwhelper.zsh
autoload -Uz _wwhelper

zstyle ':completion:*' verbose yes

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="btb"
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  docker
  npm
  osx
  pass
  z
)
# tmux

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# add fzf commands <Ctrl + t> for file search, <Ctrl + r> search command history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# init ruby env on zsh launch
eval "$(rbenv init -)"
eval $(thefuck --alias)

## Alias section
alias cp "cp -i"                                                # Confirm before overwriting something
alias rmi "rm -i"
alias mvi "mv -i"
alias q="exit"
alias e='$EDITOR'
alias ls="test \$(exa --tree --level=2 --long | wc -l) -gt 50 && exa --long --git ||  exa --tree --level=2 --long --git"
#alias ls="test -gt $(exa --tree --level=2 --long --git"
#alias l "ls -gaFh"
#alias love="/Applications/love.app/Contents/MacOS/love"
#alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

source ~/.bashrc_gpg
source ~/.profile

#Importing the shop dev_env environmental variables to zsh.
if [ -f ~/.bashrc_shop ]; then
    source ~/.bashrc_shop
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh


#bindkey -v
#export KEYTIMEOUT=1
## Use vim cli mode
#bindkey '^P' up-history
#bindkey '^N' down-history

## backspace and ^h working even after
## returning from command mode
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char

## ctrl-w removed word backwards
#bindkey '^w' backward-kill-word

## ctrl-r starts searching history backward
#bindkey '^r' history-incremental-search-backward

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t.shears/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/t.shears/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/t.shears/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/t.shears/google-cloud-sdk/completion.zsh.inc'; fi
export GOOGLE_CLOUD_KEYFILE_JSON=~/.google-cloud-platform/side-project-k8s-292014f8d773.json

source ~/ww_dotfiles/env.sh
#export fpath=("$HOME""/ww_dotfiles ""$fpath")
#autoload -U compinit
#compinit
alias jtags="ctags -R app config lib && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"
