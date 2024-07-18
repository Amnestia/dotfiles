#!/bin/bash

[ -d .vim ] || mkdir .vim
cp ~/.vimrc .
cp ~/.vim/*.vim .vim/ &&
cp ~/.vim/coc-settings.json .vim/ &&
cp ~/.vim/snippets .vim/ -r
