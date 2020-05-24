#!/usr/bin/env bash

#----------------------------------------------------------------------------- VARIABLES --------------------------------------------------------------------------------

User=
cantidad=
Fecha=
F=4
valuser=
CE=1
ROJO="\033[31;1m"
VERDE="\033[0;32m"
AMARILLO="\033[1;33m"
FIN_COL="\033[0m"

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

clear
echo""
echo -e "${VERDE}=================================== CONSULTAR CANTIDAD DE VENTAS DE UN USUARIO EN UN MES ==========================================${FIN_COL}"
echo ""
while [ "$F" -eq 4 ]
do

	echo -e "${AMARILLO}Ingrese  nombre de usuario a consultar ${FIN_COL}"
	read User

	valuser=$(cut -f 7 -d: ARCHIVO_LISTA_DE_SERVICIOS.txt|grep "$User$"|tail -1)

        if [ "$User" = "$valuser" ]
        then
		F=3
        else
		echo -e "${ROJO}El usuario es incorrecto o no tiene ventas realizadas a la fecha${FIN_COL}"
        fi
done
clear
while [ $F -eq 3 ]
do
	echo -e "${AMARILLO}Ingrese el mes y el año (MM-AAAA) a consultar${FIN_COL}"
	read Fecha
	if echo "$Fecha" | egrep -xq "0[1-9]-[0-9]{4}|1[0-2]-[0-9]{4}"

        then
                F=1
	else
             
                echo -e "${ROJO}La fecha ingresada es incorrecta"
		CE=$((CE+1))
		if [ "$CE" -eq 4 ]
		then
			clear
			echo -e "Ha superado la cantidad de errores permitidos${FIN_COL}"
			sleep 3
			./Consulta.sh
		fi
	fi
done

cut -f 6,7 -d: ARCHIVO_LISTA_DE_SERVICIOS.txt|grep "$User$"|cut -f 2,3 -d- > temp.txt

cantidad=$(grep -c "^$Fecha:" temp.txt)
clear
echo ""
echo -e "${VERDE} El usuario $User realizo el $Fecha $cantidad ventas ${FIN_COL}"

sleep 5

./Consulta.sh


