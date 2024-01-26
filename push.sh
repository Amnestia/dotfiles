#!/bin/bash

cp ~/.vim/*.vim .vim/ &&
cp ~/.vim/coc-settings.json .vim/ &&
cp ~/.vim/snippets .vim/ -r

if [ -z "$1" ]
then
	echo "Should define remote"
	exit 1
fi

if [ -z "$2" ]
then
	echo "Should define branch"
	exit 1
fi

git add . &&
git commit -e
git push $1 "$2"
