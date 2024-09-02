#!/bin/bash

define_file(){
	mime=$(file --mime-type -b "$file")
}

list_file(){
	shopt -s nullglob
	files=($select_dir/*.{7z,rar,zip,tar*})
}


unarchive(){
	define_file
	local dir="${file%.*}"
	case $mime in
		application/gzip)
			dir="${dir%.*}"
			if [ ! -d "$dir" ]
			then
				mkdir "$dir"
			fi
			tar -xvzf "$file" -C "$dir"
			;;
		application/zip)
			unzrip -d "$dir" "$file"
			;;
		application/x-rar | application/vnd.rar)
			unrar x "$file"
			;;
		application/x-7z-compressed)
			7z x "$file"
			;;
		*)
		echo "Unimplemented: $mime"
			;;
	esac
}

unarchive_dir(){
	list_file
	for i in "${files[@]}"
	do
		if [[ $i == *"part"* ]]; then
			if [[ $i != *"part1"* ]]; then
				continue
			fi
		fi
		file=$i
		unarchive
	done
}

input(){
	while [ -z "${inp##*[!0-9]*}" ] || [ $inp -lt 1 ] || [ $inp -gt $curr_max ]
	do
		echo -n ">> "
		read inp
	done
}

choose(){
	init_input_var
	curr_max=3
	echo "choose:"
	echo "1. file"
	echo "2. directory"
	echo "3. exit"
	input
}

init_input_var(){
	curr_min=1
	curr_max=0
	inp=0
}

choose_file(){
	init_input_var
	select_dir="."
	list_file
	echo "choose:"
	for i in "${files[@]}"
	do
		echo "$((++curr_max)). $i"
	done
	echo "$((++curr_max)). back"
	input
	if [ $inp -eq $curr_max ]
	then
		return
	fi
	file=${files[$(($inp-1))]}
	unarchive
}

choose_directory(){
	init_input_var
	local dir=($(find . -maxdepth 1 -type d))
	echo "choose:"
	for i in ${dir[@]}
	do
		echo "$((++curr_max)). $i"
	done
	echo ${dir_arr[0]}
	echo "$((++curr_max)). back"
	input
	if [ $inp -eq $curr_max ]
	then
		return
	fi
	select_dir=${dir[$(($inp-1))]}
	unarchive_dir
}

main(){
	while true
	do
		choose
		case $inp in
			1 )
				choose_file
				;;
			2 )
				choose_directory
				;;
			3 )
				exit 0
				;;
		esac
	done
}

main
