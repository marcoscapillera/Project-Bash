#!/usr/bin/env bash

#proyecto Sistemas Operativos II ESI-BUCEO
#Autores: Eduardo Fabre, Daniel Borche, Marcos Bueno.

#----------------------------------- VARIABLES -----------------------------------

	ARCHIVO_LISTA_DE_SERVICIOS=listaDeServicios.txt
	SEP=":"
	Servicio=
	Descripcion=
	Importe=
	Fecha=
	F=4
	CODVENTA=0
	CODCLIENTE=



#Generará automaticamente un numero de venta
#Solicitar cedula del cliente, la base de datos de cliente es proporcionada por
#otro sector, el cliente estará en dicha base de datos
#Se buscará al cliente en la base de datos

while [ "$F" -eq 4 ]
do
echo " Ingrese la cedula del cliente al que se le realizo el servicio "
	read CODCLIENTE
	if echo "$CODCLIENTE" | egrep -xq "[1-6][0-9]{6}|[1-9][0-9]{5}"
	then
	F=3
else
echo "cedula de identidad incorrecta"
fi
done


while [ "$F" -eq 3 ]

do
echo " Ingrese nombre del servicio :"
	read Servicio
	if [ "$Servicio" = "" ]
	then
		echo " No ingreso el nombre del servicio "
	else
		F=2
	fi
done
while [ "$F" -eq 2 ]
do
echo " Descripción del servicio :"
	read Descripcion
	if [ "$Descripcion" = "" ]
	then
		echo " No ingreso Descripcion del servicio "
	else
		F=1
	fi
done

while [ "$F" -eq 1 ]
do
	echo " Ingrese el importe del servicio :"
	read Importe
	if echo "$Importe" | egrep -xq "[0-9]+"
	then
		F=0
	else
		echo " Importe Incorrecto "
		echo " El Importe deben ser numeros enteros "
	fi
done

while [ "$F" -eq 0 ]
do
	echo " Ingrese fecha de venta de la siguiente forma:"
	echo " DD-MM-AAAA "
	read Fecha
	if echo "$Fecha" | egrep -xq "0[1-9]-0[1-9]-[0-9]{4}|[12][0-9]-0[1-9]-[0-9]{4}|3[01]-0[1-9]-{4}[0-9]|0[1-9]-1[0-2]-[0-9]{4}|[12][0-9]-1[0-2]-[0-9]{4}|3[01]-1[0-2]-[0-9]{4}"
	then



		F=1
	else
		echo La fecha ingresada es incorrecta
		echo Ingrese una fecha valida
	fi
done
Vendedor=$(whoami)

CODVENTA=$(tail -1 Icodventa|cut -f1 -d :)
CODVENTA=$((CODVENTA+1))


echo "$CODVENTA$SEP$CODCLIENTE$SEP$Servicio$SEP$Descripcion$SEP$Importe$SEP$Fecha$SEP$Vendedor" >> ARCHIVO_LISTA_DE_SERVICIOS.txt
echo "$CODVENTA" > Icodventa
./menu.sh
