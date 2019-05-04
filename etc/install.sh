#!/bin/sh

set -e
set -u

install() {
  dotfiles=$HOME/dotfiles


  if [ -d "$dotfiles" ]; then
    (cd "$dotfiles" && git pull --rebase)
    #echo ''
  else
    git clone https://github.com/pooseijin/dotfiles "$dotfiles"
  fi

  cd $dotfiles
  if [ $? -ne 0 ]; then
      die "not found: $dotfiles"
  fi

  for f in .??*
    do
      [ "$f" = ".git" ] && continue
      [ "$f" = ".cache" ] && continue
      ln -snfv "$dotfiles/$f" "$HOME"/"$f"
  done
}

install
