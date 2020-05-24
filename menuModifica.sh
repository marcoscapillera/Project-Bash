#!/usr/bin/env bash
#
# service_informatico_Dell.sh - Sistema para gestion de servicios
#
# Proyecto Sistemas Operativos II ESI-Buceo
# Autores:  Eduardo Fabre, Daniel Borche, Marcos Bueno.
#
#
# -------------------------------------------------------------------------------------------------------------------------------- #


# --------------------------------------------------------------------------- #
## ------------------------------- VARIABLES -------------------------------- #


	CYAN="\033[1;36m"

	ROJO="\033[31;1m"

	VERDE="\033[0;32m"

	AMARILLO="\033[1;33m"

	MARRON="\033[0;33m"

	FIN_COL="\033[0m"

	ROJO2="\033[31;1m"

	AMARILLO2="\033[33;1mA"

	VERDE2="\033[32;1m"

#-----------------------------------------------------------------------------#
#
#
# ---------------------------        VALIDACIONES --------------------------- #





find . -type f -exec chmod 777 {} \;
find listaClientes.txt -type f -exec chmod 555 {} \;




# --------------------------------------------------------------------------- #

	clear

	echo ""

	echo "  "

	echo -e "${VERDE}========= Mantenimiento Informatico ==========================="

	echo ""

	echo -e "\t1) Modificar Cedula Cliente"

	echo -e "\t2) Modificar Servicie"

	echo -e "\t3) Modificar la descripcion"

	echo -e "\t4) Modificar el precio"

	echo -e "\t5) Modificar la fecha "

	echo -e "\t6) Volver a menu principal"

	echo -e "\tQ) Salir"

	echo ""

	echo -e "\t Digite una opcion: ${FIN_COL}"

	read OP

	case "$OP" in

			1)
			#Redirecciona al bash de mCedula
			./mCedula.sh
					;;

			2)
			#Redirecciona al bash mServicio
			./mServicio.sh
					;;
			3)
			#Redirecciona al bash mDescripcion
			./mDescripcion.sh

					;;

			4)
			#Redirecciona al bash a mPrecio
			./mImporte.sh
					;;
			5)
			#Redirecciona al bash a mFecha
			./mFecha.sh
					;;
			6)
			#Redirecciona al bash a mFecha
			./menu.sh
					;;

			q|Q) exit 0     ;;

			*) echo -e "${ROJO}\t Opcion inválida! "

			echo ""

	esac
