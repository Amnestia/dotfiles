#!/bin/bash

scripts_dir=./scripts/pull

for i in $(ls $scripts_dir)
do
	echo "======================== Executing $scripts_dir/$i ==============================="
	$scripts_dir/$i
done
