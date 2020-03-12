# Util functions
abs(){ echo $1 | tr -d -; }

determineDelimiter(){ 
	linesInFile=$(cat $1 | wc -l)
	linesWithComma=$(cat $1 | grep "," | wc -l)
	linesWithSemiColon=$(cat $1 | grep ";" | wc -l)
	if [ $(abs $((linesInFile-linesWithComma))) -le 1 ]
	then
		echo ","
	elif [ $(abs $((linesInFile-linesWithSemiColon))) -le 1 ]
	then
		echo ";"
	else
		echo "\t"
	fi
}

# Get list of files that are equal
files=$(find . -not -path "*output*" -mindepth 1 -printf '%h %f\n' | sort -t ' ' -k 2,2 | uniq -f 1 --all-repeated=separate | tr ' ' '/')

SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
names=($files) # split to array $names
IFS=$SAVEIFS   # Restore IFS

#Find delimiter from first file
delim=$(determineDelimiter ${names[1]} )

#Setup output folder
mkdir ./output
mkdir ./output/diff/

for (( i=0; i<${#names[@]}; i+=2 ))
do
	usedFiles="$i,${names[$i]},${names[$i+1]}"
	echo "$usedFiles"
	filename=$(basename "${names[$i]}")
	diff=$(awk -F "${delim}" -v delim="${delim}" 'BEGIN { OFS=delim} FNR==NR { a[(FNR"")] = ($0 delim FILENAME); next } { print a[(FNR"")], $0(delim)FILENAME }' ${names

[$i]} ${names[$i+1]} | awk -F "${delim}" -v "OFS=," '{ for (i=1; i<=NF/2; i++) print $i}')

	echo "$diff" > "./output/diff/$filename"

done
