# !/bin/bash

file_input="data.csv"
file_output="data.txt"
grep -v "^#" $file_input | sed "s/, / /g" > $file_output #s per substitute ed g per global

even=$(awk "{ for (i=1;i<=NF;i++) if ($i%2==0) count++ } END { print count}" $file_output )
echo "i numeri pari sono $even"

thresold=$(echo "100*sqrt(3)/2" | bc -l)
under=0
over=0
while read x y z x1 y1 z1
do
	distance=$(echo "sqrt($x^2+$y^2+$z^2)" | bc -l )
	if (( $(echo "$distance > $thresold" | bc -l ) ))
	#devo fare così perché distance e thresold non sono numeri interi, senno potevo fare if [ $var1 -gt $var2 ]
	then
		echo "$x $y $z $x1 $y1 $z1"
		((over++))
	else
		echo "yolooooo $x $y $z $x1 $y1 $z1"
		((under++))
	fi
done < $file_output
echo "I numeri superiori a $thresold are $over"
echo "I numeri inferiori a $thresold are $under"

read -p "inserire il numero di file: " i
echo "valore variabile $i"
mkdir -p files_ex_bash2
cd files_ex_bash2
for (( k=1;k<=$i;k++ )) 
do
	awk -v div=$k ' { for(j=1;j<=NF;j++) {$j=sprintf("%.2f",$j/div)} print $0 } ' "../$file_output" > "divisione_$k.txt"
	#PROVA PER SPORT PER CAPIRE AWK
	#awk  -v div=$k ' { for (j=1;j<=NF;j++) {$j= sprintf("%.2f",$j/div); count++;} print $0  } END {print count}' "../$file_output" > "divisione_$k.txt"
	
	#awk  -v div=$k ' { for (j=1;j<=NF;j++) $j= sprintf("%.2f",$j/div) }1' "../$file_output" > "divisione_$k.txt"
	#1 in }1" super importante perché è quello che forza la riga ad essere stampata
done


