#!/bin/bash

# Zdefiniuj zmienne
infile1="$1"
infile2="$2"
outfile="$3"

# Pętla while read -r dla infile1
while IFS= read -r f1
do
  found_in_infile2=false

  # Pętla while read -r dla infile2
  while IFS= read -r f2
  do
    # Sprawdź czy linia f1 jest równa linii f2
    if [ "$f1" == "$f2" ]; then
      found_in_infile2=true
      break
    fi
  done < "$infile2"

  # Sprawdź czy linia f1 istnieje tylko w infile1
  if [ "$found_in_infile2" = false ]; then
    echo "Linia z $infile1 ($f1) istnieje tylko w $infile1 i nie występuje w $infile2"
    echo "$f1" >> "$outfile"
  fi
done < "$infile1"

echo "Przetwarzanie zakończone. Linie istniejące tylko w $infile1 zapisano w pliku $outfile."
