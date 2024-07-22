#!/bin/bash
inputFile="$1"
outputFile="$2"
col=$(head -n 1 "$inputFile" | wc -w)
for c in $(seq 1 "$col")
do
	echo $(cut -d' ' -f $c "$inputFile" | tr '\n' ' ') >> "$outputFile"
done
