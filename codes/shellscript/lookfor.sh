#!/bin/bash
# procura arquivos e os copias. 
# script usado na cópia dos arquivos .csv do EDX.

copyfile() {
	line="$@" # pega todo argumento
	D=$(date -d 'today' '+%Y.%m.%d.%H.%m.%s')
	find ./ -name "*$line*" > /tmp/look.$D
	while read line
	do
		cp ./$line ./$pasta/
	done < /tmp/look.$D
	rm /tmp/look.$D 
}


echo "Deseja copiar os arquivos em qual pasta?"
read pasta
mkdir ./$pasta

if [ "$1" == "" ]; then 
	FILE="/dev/stdin"
else 
	FILE="$1"
	if [ ! -f $FILE ]; then
		echo "$FILE: Esse arquivo nao existe!!!"
		exit 1
	elif [ ! -r $FILE ]; then 
		echo "$FILE: O arquivo nao pode ser aberto"
		exit 2
	fi
fi
 
while read line
do
	copyfile  $line 
done < $FILE

