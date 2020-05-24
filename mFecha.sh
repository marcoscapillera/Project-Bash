#!/usr/bin/env bash

#proyecto Sistemas Operativos II ESI-BUCEO
#Autores: Eduardo Fabre, Daniel Borche, Marcos Bueno.

#----------------------------------- VARIABLES --------------------------------

id=""
banco="ARCHIVO_LISTA_DE_SERVICIOS.txt"
temp=temp.txt
i=0
SEP=":"
vacio=""

#-----------------INGRESO DE DATO----------------------------------------------
echo "Ingrese la id que corresponde a la fecha a modificar"

read id
F=0
while [ "$F" -eq 0 ]
do
	echo " Ingrese fecha nueva:"
	echo " DD-MM-AAAA "
	read datonuevo

	if echo "$datonuevo" | egrep -xq "0[1-9]-0[1-9]-[0-9]{4}|[12][0-9]-0[1-9]-[0-9]{4}|3[01]-0[1-9]-{4}[0-9]|0[1-9]-1[0-2]-[0-9]{4}|[12][0-9]-1[0-2]-[0-9]{4}|3[01]-1[0-2]-[0-9]{4}"
	then

		F=1
  else
		echo La fecha ingresada es incorrecta
		echo Ingrese una fecha valida
	fi
done


#----------------VERIFICA EXISTENCIA-------------------------------------------
if [ "$(grep  $id $banco | cut -d $SEP -f 1)" =  "$id" ]; then
  echo "La id si Existe"
  i=1

else

      echo -e "${ROJO}No existe el id${FIN_COL}"
fi
#--------------SI EXISTE ELIMINA EL REGISTRO-----------------------------------

if [ $i -eq 1 ]; then


id="$(grep $id $banco | cut -d $SEP -f 1)" # toma el   id

cedula="$(grep $id $banco | cut -d $SEP -f 2)" # toma el nombre

servicio="$(grep $id $banco | cut -d $SEP -f 3)" # toma el telefono

Descripcion="$(grep $id $banco | cut -d $SEP -f 4)" # toma la Descripción

importe="$(grep $id $banco | cut -d $SEP -f 5)" # toma el importe

fecha="$(grep $id $banco| cut -d $SEP -f 6)" # toma la fecha

vendedor="$(grep $id $banco | cut -d $SEP -f 7)" # toma el vendedor


viejo="${id}$SEP${cedula}$SEP${servicio}$SEP${Descripcion}$SEP${importe}$SEP${fecha}$SEP${vendedor}"


nuevo="${id}$SEP${cedula}$SEP${servicio}$SEP${Descripcion}$SEP${importe}$SEP${datonuevo}$SEP${vendedor}"


sed  -r -i "s/${viejo}/${nuevo}/g"  "ARCHIVO_LISTA_DE_SERVICIOS.txt"


echo "${VERDE}La fecha fue modificado con exito${FIN_COL}"

fi


#VUELVE AL MENU
echo -e "1) Volver al menu "

echo ""

read OP
case $OP in
    1)
    ./menu.sh
    ;;
esac #FIN DEL BASH
