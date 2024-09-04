#!/bin/bash

[ -d ~/.vim ] || mkdir ~/.vim
cp .vimrc ~/.vimrc
cp .vim/*.vim ~/.vim/ &&
cp .vim/coc-settings.json ~/.vim/ &&
cp -r .vim/snippets ~/.vim
[ -d ~/.vim/undo ] || mkdir ~/.vim/undo
[ -d ~/.vim/swap ] || mkdir ~/.vim/swap
