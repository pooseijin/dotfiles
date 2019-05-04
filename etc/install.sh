#!/bin/sh

set -e
set -u

install() {
  dotfiles=$HOME/dotfiles

  symlink() {
    [ -e "$2" ] || ln -sf "$1" "$2"
  }

  if [ -d "$dotfiles" ]; then
    (cd "$dotfiles" && git pull --rebase)
  else
    git clone https://github.com/pooseijin/dotfiles "$dotfiles"
  fi

  symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
  symlink "$dotfiles/.vim" "$HOME/.vim"
  symlink "$dotfiles/.bashrc" "$HOME/.bashrc"
}

install
