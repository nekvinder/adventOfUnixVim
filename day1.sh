#!/bin/bash

filename=1.puzzle
list1=$(cat $filename | cut -d ' ' -f1 | sort)
list2=$(cat $filename | cut -d ' ' -f2- | sort)

declare -a arr1
arr1=($list1)
arr2=($list2)

rm -f distances.txt

for i in "${!arr1[@]}"; do
	printf "%s-%s+" "${arr2[i]}" "${arr1[i]}" >>distances.txt
done
echo "0" >>distances.txt

cat distances.txt | bc
