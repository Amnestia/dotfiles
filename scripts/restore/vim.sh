#!/bin/bash

[ -d ~/.vim ] || mkdir ~/.vim
cp .vimrc ~/.vimrc
cp .vim/*.vim ~/.vim/ &&
cp .vim/coc-settings.json ~/.vim/ &&
cp -r .vim/snippets ~/.vim
