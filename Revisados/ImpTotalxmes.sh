!/usr/bin/env bash


#-------------------------------------------------------------------------- VARIABLES ---------------------------------------------------------------------------------

F=3
Fecha=
total=0
x=
CE=1
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

clear
echo "---------------------------------------------------------- IMPORTE TOTAL DE VENTAS EN UN MES ---------------------------------------------------------------------"
echo ""
while [ $F -eq 3 ]
do
	echo " Ingrese la fecha a consultar de la siguiente forma: "
	echo " MM-AAAA "
	read Fecha

	if echo "$Fecha" | egrep -xq "0[1-9]-[0-9]{4}|1[0-2]-[0-9]{4}"

        then
                F=1
        else
                clear
                echo La fecha ingresada es incorrecta
                echo Ingrese una fecha valida
		echo""
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

cut -f 5,6 -d: ARCHIVO_LISTA_DE_SERVICIOS.txt|grep "$Fecha$"|cut -f 1 -d: > temp.txt

for x in $(cat temp.txt)
do total=$(($total+$x))
done

clear

echo""
echo " En el mes de $Fecha se vendieron USD $total "

sleep 5

./Consulta.sh

