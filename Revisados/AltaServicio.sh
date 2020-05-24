#!/usr/bin/env bash

#proyecto Sistemas Operativos II ESI-BUCEO
#Autores: Eduardo Fabre, Daniel Borche, Marcos Bueno.

#----------------------------------- VARIABLES -----------------------------------

	SEP=":"
	Servicio=
	Descripcion=
	Importe=
	valcliente=
	Fecha=
	F=4
	CE=1
	CODVENTA=0
	CODCLIENTE=
	ROJO="\033[31;1m"
	AMARILLO="\033[1;33m"
	VERDE="\033[0;32m"
	FIN_COL="\033[0m"


#Solicita cedula del cliente y verifica en la base de datos de cliente si existe cliente
#Solicita nombre de servicio y descripcion del mismo y valida campos vacios
#solicita importe y verifica que sean numeros enteros
#solicita ingresar fecha y valida
#realiza alta y envía los datos a ARCHIVO_LISTA_DE_SERVICIOS.txt

clear
echo -e "${VERDE}========================================== ALTA DE SERVICIO ==================================================${FIN_COL}"
echo ""

while [ "$F" -eq 4 ]
do
echo -e "${AMARILLO} Ingrese la cedula del cliente al que se le realizo el servicio sin puntos ni guiones${FIN_COL}"
	read CODCLIENTE
	valcliente=$(cut -f 1 -d: listaClientes.txt|grep "^$CODCLIENTE")

        if [ "$CODCLIENTE" != "$valcliente" ]
        then
                
                echo -e "${ROJO} Cédula inválida o Inexistente en la lista de clientes"
		echo ""
		CE=$((CE+1))
		if [ "$CE" -eq 4 ]
		then
			clear
			echo -e "Ha superado la cantidad de errores permitidos${FIN_COL}"
			sleep 3

			./menu.sh
		fi

	else
                F=3
        fi
done

CE=1

while [ "$F" -eq 3 ]

do
echo -e "${AMARILLO} Ingrese nombre del servicio :${FIN_COL}"
	read Servicio
	if [ "$Servicio" = "" ]
	then
		echo -e " ${ROJO}No ingreso el nombre del servicio ${FIN_COL}"
		CE=$((CE+1))
		if [ "$CE" -eq 4 ]
		then
			clear
			echo -e "${ROJO}Ha superado la cantidad de errores permitidos${FIN_COL}"
			sleep 3
			./menu.sh
		fi
	else
		F=2
	fi
done
CE=1
while [ "$F" -eq 2 ]
do
echo -e "${AMARILLO}Descripción del servicio :${FIN_COL}"
	read Descripcion
	if [ "$Descripcion" = "" ]
	then
		echo -e "${ROJO} No ingreso Descripcion del servicio "
		CE=$((CE+1))
		if [ "$CE" -eq 4 ]
		then
			clear
			echo -e "Ha superado la cantidad de errores permitidos${FIN_COL}"
			sleep 3
			./menu.sh
		fi

	else
		F=1
	fi
done
CE=1
while [ "$F" -eq 1 ]
do
	echo -e "${AMARILLO} Ingrese el importe del servicio :${FIN_COL}"
	read Importe
	if echo "$Importe" | egrep -xq "[0-9]+"
	then
		F=0
	else
		echo -e "${ROJO} Importe Incorrecto "
		echo -e "El Importe deben ser numeros enteros "
		CE=$((CE+1))
                if [ "$CE" -eq 4 ]
                then
                        clear
                        echo -e "Ha superado la cantidad de errores permitidos${FIN_COL}"
                        sleep 3
                        ./menu.sh
                fi

	fi
done
CE=1
while [ "$F" -eq 0 ]
do
	echo -e "${AMARILLO} Ingrese fecha de venta de la siguiente forma:"
	echo -e " DD-MM-AAAA${FIN_COL} "
	read Fecha
	if echo "$Fecha" | egrep -xq "0[1-9]-0[1-9]-[0-9]{4}|[12][0-9]-0[1-9]-[0-9]{4}|3[01]-0[1-9]-{4}[0-9]|0[1-9]-1[0-2]-[0-9]{4}|[12][0-9]-1[0-2]-[0-9]{4}|3[01]-1[0-2]-[0-9]{4}"
	then
		F=1
	else
		echo -e "${ROJO}La fecha ingresada es incorrecta"
		echo -e ""
		CE=$((CE+1))
                if [ "$CE" -eq 4 ]
                then
                        clear
                        echo -e "Ha superado la cantidad de errores permitidos${FIN_COL}"
                        sleep 3
                        ./menu.sh
                fi

	fi
done
Vendedor=$(whoami)

CODVENTA=$(tail -1 Icodventa|cut -f1 -d :)
CODVENTA=$((CODVENTA+1))


echo "$CODVENTA$SEP$CODCLIENTE$SEP$Servicio$SEP$Descripcion$SEP$Importe$SEP$Fecha$SEP$Vendedor" >> ARCHIVO_LISTA_DE_SERVICIOS.txt
echo "$CODVENTA" > Icodventa
clear
echo -e "${VERDE}ALTA GENERADA EXITOSAMENTE${FIN_COL}"
sleep 2
./menu.sh
