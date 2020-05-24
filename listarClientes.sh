#!/usr/bin/env bash

#proyecto Sistemas Operativos II ESI-BUCEO
#Autores: Eduardo Fabre, Daniel Borche, Marcos Bueno.

#----------------------------------- VARIABLES -----------------------------------

busca=""
BANCO="listaClientes.txt"
SEP=":"


CYAN="\033[1;36m"

ROJO="\033[31;1m"

VERDE="\033[0;32m"

AMARILLO="\033[1;33m"

MARRON="\033[0;33m"

FIN_COL="\033[0m"

# Mosrar un determinado Cliente


echo -e "${CYAN}============================= Listar Clientes==============="



    # Linea de inicio

    while read -r linea # Início del while

    do

        # Linea que empiece con "#"...continue

        [ "$(echo $linea | cut -c1)" = "#" ] && continue

        # Linea vacia ?...continue

        [ ! "$linea" ] && continue

        # Extraccion de datos


        echo -e "${CYAN}---------------------------------------------${FIN_COL}"

        CEDULA="$(echo "$linea" | cut -d $SEP -f 1)" # toma la cedula

        NOMBRE="$(echo "$linea" | cut -d $SEP -f 2)" # toma el nombre

        DIRECCION="$(echo "$linea" | cut -d $SEP -f 3)" # toma la Direccion

        NUMERO="$(echo "$linea" | cut -d $SEP -f 4)" # toma el numero puerta

        TELEFONO="$(echo "$linea" | cut -d $SEP -f 5)" # toma el telefono


          # Muestra Datos

          echo -e "${MARRON}Cedula:${FIM_COR} $CEDULA"

          echo -e "${MARRON}Nombre:${FIM_COR} $NOMBRE"

          echo -e "${MARRON}Direccion:${FIM_COR} $DIRECCION"

          echo -e "${MARRON}Numero:${FIM_COR} $NUMERO"

          echo -e "${MARRON}Telefono:${FIM_COR} $TELEFONO"


    done < "$BANCO" # Fin del while (Recebe el archico del banco de datos)
echo -e "${CYAN}---------------------------------------------${FIN_COL}"


#VUELVE AL MENU
echo -e "${CYAN}1) Volver al menu "

echo ""

read OP
case $OP in
    1)
    ./menu.sh
    ;;
esac #FIN DEL BASH
