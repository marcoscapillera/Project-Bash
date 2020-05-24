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

CYAN="\033[1;36m"

ROJO="\033[31;1m"

VERDE="\033[0;32m"

AMARILLO="\033[1;33m"

MARRON="\033[0;33m"

FIN_COL="\033[0m"

#-----------------INGRESO DE DATO----------------------------------------------
echo -e "${AMARILLO}Ingrese id del servicio a elminar${FIN_COL}"

read id


#----------------VERIFICA EXISTENCIA-------------------------------------------
if [ "$(grep  $id $banco | cut -d $SEP -f 1)" =  "$id" ]; then
  echo "El id Existe"
  i=1

else

    echo -e "${ROJO}No existe el id${FIN_COL}"
fi

#--------------SI EXISTE ELIMINA EL REGISTRO-----------------------------------

if [ $i -eq 1 ]; then

grep -i -v "$id$SEP" "$banco" > "$temp"
mv "$temp" "$banco"
echo -e "${VERDE}Registro eliminado con exito${FIN_COL}"
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
