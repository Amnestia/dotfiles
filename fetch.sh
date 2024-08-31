#!/bin/bash

scripts_dir=./scripts/fetch

for i in $(ls $scripts_dir)
do
	echo "======================== Executing $scripts_dir/$i ==============================="
	$scripts_dir/$i
done
