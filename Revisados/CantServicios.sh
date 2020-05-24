#!/usr/bin/env bash

#-------------------------------------------------------------------------- VARIABLES ---------------------------------------------------------------------------------

VERDE="\033[0;32m"
ROJO="\033[31;1m"
AMARILLO="\033[1;33m"
FIN_COL="\033[0m"
Cantidad=
Cliente=
Fecha=
valcliente=
F=3
CE=1
clear
echo -e "${VERDE}================================== CONSULTA DE SERVICIOS REALIZADOS A UN CLIENTE POR MES ===========================================${FIN_COL}"
echo ""


while [ $F -eq 3 ]
do
	echo -e "${AMARILLO}Ingrese Cedula de cliente a consultar${FIN_COL}"
	read Cliente

	valcliente=$(cut -f 1 -d: listaClientes.txt|grep "^$Cliente")

	if [ "$Cliente" = "$valcliente" ]
	then
		F=2

	else
	   	echo -e "${ROJO}Ingrese una cedula valida de la lista de clientes"
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
CE=1
while [ $F -eq 2 ]
do
	echo -e "${AMARILLO}Ingrese el mes y el año (MM-AAAA) a consultar${FIN_COL}"
	read Fecha

	if echo "$Fecha" | egrep -xq "0[1-9]-[0-9]{4}|1[0-2]-[0-9]{4}"

	then
		F=1
	else
		clear
		echo -e "${ROJO}La fecha ingresada es incorrecta"
                echo -e ""
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

cut -f 2,6 -d: ARCHIVO_LISTA_DE_SERVICIOS.txt|grep "^$Cliente:"|cut -f 2,3 -d- > temp.txt

cantidad=$(grep -wc "$Fecha" temp.txt)
clear
echo ""
echo -e "${VERDE} La cantidad de servicios realizados en un mes de la CI: $Cliente en $Fecha es de $cantidad ventas${FIN_COL} "

sleep 5

./Consulta.sh

