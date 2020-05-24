#!/usr/bin/env bash

#proyecto Sistemas Operativos II ESI-BUCEO
#Autores: Eduardo Fabre, Daniel Borche, Marcos Bueno.

#----------------------------------- VARIABLES -----------------------------------

LISTASERVICIOS="ARCHIVO_LISTA_DE_SERVICIOS.txt"

CYAN="\033[1;36m"

ROJO="\033[31;1m"

VERDE="\033[0;32m"

AMARILLO="\033[1;33m"

MARRON="\033[0;33m"

FIN_COL="\033[0m"

SEP=":"

clear

    echo -e "${CYAN}===============Lista de Servicio===============${FIN_COL}"

    while read -r linha # Início del while que recorre el  banco

    do

        # Linea empieza con  "#"...continue

        [ "$(echo $linha | cut -c1)" = "#" ] && continue

        # Linea vacía?...continue

        [ ! "$linha" ] && continue

        # Linea de início

        echo -e "${CYAN}---------------------------------------------${FIN_COL}"

        # Extrae el codigo, cedula, servicio, Descripción, importe. fecha y vendedor

         id="$(echo "$linha" | cut -d $SEP -f 1)" # toma el   id

         cedula="$(echo "$linha" | cut -d $SEP -f 2)" # toma el nombre

        servicio="$(echo "$linha" | cut -d $SEP -f 3)" # toma el telefono

        Descripcion="$(echo "$linha" | cut -d $SEP -f 4)" # toma la Descripción

        importe="$(echo "$linha" | cut -d $SEP -f 5)" # toma el importe

        fecha="$(echo "$linha" | cut -d $SEP -f 6)" # toma la fecha

        vendedor="$(echo "$linha" | cut -d $SEP -f 7)" # Pega el vendedor

        # Muestra Datos

        echo -e "${MARRON}ID:${FIM_COR} $id"

        echo -e "${MARRON}Cedula:${FIM_COR} $cedula"

        echo -e "${MARRON}Servicio:${FIM_COR} $servicio"

        echo -e "${MARRON}Descripción:${FIM_COR} $Descripcion"

        echo -e "${MARRON}Importe:${FIM_COR} $importe"

        echo -e "${MARRON}Fecha:${FIM_COR} $fecha"

        echo -e "${MARRON}Vendedor:${FIM_COR} $vendedor"

    done < "$LISTASERVICIOS" # Fin del while ( while recibe  archivo del banco)

    # Linea fin

    echo -e "${CYAN}---------------------------------------------${FIN_COL}"


    echo -e "${CYAN}1) Volver al menu "

    read OP
  case $OP in
        1)
        ./menu.sh
        ;;
  esac
