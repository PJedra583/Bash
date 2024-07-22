#!/bin/bash
listFiles() {
local dir="$1"
	for entry in "$dir"/*
	do 
		if [[ -d "$entry" ]]
		then
			echo "Folder to: $entry"
			listFiles "$entry"
		elif [[ -f "$entry" ]]
		then
			echo "Plik to: $entry"
		fi
	done
}

homefold="/home/tomasz/"


listFiles "$homefold"
