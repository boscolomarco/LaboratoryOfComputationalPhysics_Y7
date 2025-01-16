# !/bin/bash


if [ ! -f "BASH3inventato.txt" ]
then
	wget -O "BASH3inventato.txt" https://www.dropbox.com/s/867rtx3az6e9gm8/LCP_22-23_students.csv
fi

tail -n +2 "BASH3inventato.txt" | awk 'BEGIN {FS=",";OFS="-"}{print NR,$1,$2}'


# awk ' BEGIN {}   { for(i=1;i<NF;i++) comando nel for ; comando pensi fuori dal for; comando fuori dal for}    END{} '

: << COMMENT

NF numero delle parole di una linea
NR numero del record, cioé il numero della linea esaminata
FILENAME nome del file di dati
FS separatore di campi (normalmente spazio o tabulazione)
RS separatore di record (normalmente newline)



%c un singolo carattere
%d un intero decimale
%e numero a virgola mobile in notazione scientifica
%f numero a virgola mobile in formato [-]ddd.ddd
%i numero intero
%u numero intero senza segno
%s stringa
%% scrive il simbolo “%”.

Per esempio
END { printf "Totale = %6d Media = %6.2f \n", somma, somma/NR }


COMMENT
