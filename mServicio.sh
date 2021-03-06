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
echo "Ingrese id del servicio a modificar"

read id

echo "Ingrese dato del servicio a ingresar"

read datonuevo

#----------------VERIFICA EXISTENCIA-------------------------------------------
if [ "$(grep  $id $banco | cut -d $SEP -f 1)" =  "$id" ]; then
  echo "El id Existe"
  i=1

else

      echo -e "${ROJO}No existe el id${FIN_COL}"
fi
#--------------SI EXISTE ELIMINA EL REGISTRO-----------------------------------

if [ $i -eq 1 ]; then


id="$(grep $id $banco | cut -d $SEP -f 1)" # toma el   id

cedula="$(grep $id $banco | cut -d $SEP -f 2)" # toma la cedula

servicio="$(grep $id $banco | cut -d $SEP -f 3)" # toma el servicio

Descripcion="$(grep $id $banco | cut -d $SEP -f 4)" # toma la Descripción

importe="$(grep $id $banco | cut -d $SEP -f 5)" # toma el importe

fecha="$(grep $id $banco| cut -d $SEP -f 6)" # toma la fecha

vendedor="$(grep $id $banco | cut -d $SEP -f 7)" # toma el vendedor


viejo="${id}$SEP${cedula}$SEP${servicio}$SEP${Descripcion}$SEP${importe}$SEP${fecha}$SEP${vendedor}"


nuevo="${id}$SEP${cedula}$SEP${datonuevo}$SEP${Descripcion}$SEP${importe}$SEP${fecha}$SEP${vendedor}"


sed  -r -i "s/${viejo}/${nuevo}/g"  "ARCHIVO_LISTA_DE_SERVICIOS.txt"


echo "${VERDE}El servicio fue modificado con exito${FIN_COL}"

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
