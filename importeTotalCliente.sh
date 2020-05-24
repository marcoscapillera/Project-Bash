#!/usr/bin/env bash

CYAN="\033[1;36m"

ROJO="\033[31;1m"

VERDE="\033[0;32m"

AMARILLO="\033[1;33m"

MARRON="\033[0;33m"

FIN_COL="\033[0m"



BASEDEDATOS="ARCHIVO_LISTA_DE_SERVICIOS.txt"
clear


	echo -e "${AMARILLO}Ingrese Cedula de cliente a consultar${FIN_COL}"
read Cliente


echo -e "${VERDE}Importe total compras del Cliente $Cliente : "


	grep  $Cliente $BASEDEDATOS  | echo "$(cut -d : -f 5)" > temp.txt

  sum=0;

  while read num;
  do
  ((sum += num));

done < temp.txt; echo $sum


	echo -e "1) Volver al menu ${FIN_COL}"

echo ""

	read OP
case $OP in
			1)
			./menu.sh
			;;
esac
