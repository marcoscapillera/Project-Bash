#!/usr/bin/env bash

# --------------------------------------------------------------- VARIABLES --------------------------------------------------------

F=3
CE=1
Fecha=
lista=

# ----------------------------------------------------------------------------------------------------------------------------------
clear

echo "---------------------------------- CLIENTES QUE RECIBIERON SERVICIOS EN DETERMINADO MES --------------------------------------"
echo ""

while [ $F -eq 3 ]
do
        echo "Ingrese el mes y el año (MM-AAAA) a consultar"
        read Fecha
        if echo "$Fecha" | egrep -xq "0[1-9]-[0-9]{4}|1[0-2]-[0-9]{4}"

        then
                F=2
	else
	       	
                echo La fecha ingresada es incorrecta
                echo Ingrese una fecha valida
		CE=$((CE+1))
                if [ "$CE" -eq 4 ]
                then
                        clear
                        echo "Ha superado la cantidad de errores permitidos"
                        sleep 3
                        ./Consulta.sh
                fi

        fi
done


cut -f 2,6 -d: ARCHIVO_LISTA_DE_SERVICIOS.txt|grep "$Fecha$"|cut -f 1 -d: > temp.txt

lista=$(cat temp.txt|sort|uniq)
if [ -z "$lista" ]
then
	echo " No hubo clientes que recibieran servicios "

else
	clear
	echo ""
	echo "	 Los clientes que recibieron servicios este mes son: $lista "

fi

sleep 5

./Consulta.sh
