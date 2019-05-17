dotfiles
========

My Mac and Linux dotfiles and an accompanying install scripts. Includes a `write.sh` bash script I
wrote to symlink files into the correct locations while still being in `~/dotfiles` for version
control.

Configurations so far:
1. [Vim](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.vimrc) and [Nvim](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.nvimrc)
1. [Git config](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.gitconfig)
1. [Tmux](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.tmux.conf)
1. [Slate](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.slate)
1. [Zsh](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.zshrc)
1. [Git Global Ignore](https://gitlab.com/BTBTravis/dotfiles/blob/master/mac/.gitignore_global)

Installation
------------
Everything is setup to for the repo to be placed in the users home dir under the name `~/dotfiles`
1. `cd && git clone http://gitlab.btbbackend.tech/t/dotfiles.git` - change directory into home
   directory then clone the repo into home dir
1. `cd dotfiles`
1. `./write.sh` run the script symlink the files

*note* `write.sh` script backups files to a tar in `/tmp` should you make a mistake


## Helpful Links
* Bash colors: https://jonasjacek.github.io/colors/
* Inspiration: https://www.reddit.com/r/unixporn
