#!/bin/bash
outfile="$1"
for file in *
do
	if [ -f "$file" ]
	then
		lineCount=$(wc -l  < "$file")
		middleLine=$((lineCount / 2))

		if [ $((lineCount % 2)) -eq 1 ]
		then
			middleLine=$((middleLine + 1 ))
		fi

	head -n "$middleLine" "$file" | tail -n 1 >> "$outfile"
	fi
done

echo "Srodkowe linie zapsiani do pliku: $outfile"

