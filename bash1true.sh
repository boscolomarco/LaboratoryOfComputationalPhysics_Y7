# !/bin/bash 

#cd $HOME
#cd ~
mkdir -p "EXBASH1"
cd "EXBASH1"
file_name=$1
if [ ! -f "$file_name"  ]
then
	echo "file doesn't exist I'll create."
	wget -O $file_name https://www.dropbox.com/s/867rtx3az6e9gm8/LCP_22-23_students.csv
else
	echo "the file already exists"
fi

grep "Physics" $file_name > "Physics_$file_name"
grep "PoD" $file_name > "PoD_$file_name"

#Family name(s),Given name(s),E-mail,Master program
#while IFS="," read Surname Name mail course
#do
#	echo "$Surname $Name $mail $course"
#done < <(tail -n +2 $file_name)

max_letter=""
max_count=0
for k in {A..Z}
do
	count=$( tail -n +2 $file_name | grep -c "^$k")
	echo "Surnames that start with $k are $count"
	if [ $count -gt $max_count ]
	then
		max_count=$count
		max_letter=$k		
	fi
done
echo "The starting letter of Surnames with most occurencies is $max_letter with $max_count times"


for ((i=0;i<=17;i++))
do
	tail -n +2 $file_name | awk -v var=$i '{ if(NR%18==var ) print $0 }' > "$i Modulo 18 $file_name"
	#$0 è l'intera riga in awk
done



