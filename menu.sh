#!/usr/bin/env bash
#
# service_informatico_Dell.sh - Sistema para gestion de servicios
#
# Proyecto Sistemas Operativos II ESI-Buceo
# Autores:  Eduardo Fabre, Daniel Borche, Marcos Bueno.
#







AYUDA="ayuda.txt"



#Menu Ayuda

case "$1" in

	--help) vim $AYUDA

	;;

esac


## ------------------------------- VARIABLES -------------------------------- #


	ARCHIVO_LISTA_DE_SERVICIOS="ARCHIVO_LISTA_DE_SERVICIOS.txt"
	ALTA="AltaServicio.sh"




 	NOMBRE_CLIENTE=

	DESCRIPCION=
	MONTO=
	SERVICE=
	SEP=":"

	CYAN="\033[1;36m"

	ROJO="\033[31;1m"

	VERDE="\033[0;32m"

	AMARILLO="\033[1;33m"

	MARRON="\033[0;33m"

	FIN_COL="\033[0m"


#---------------- -------------------------------------------------------------#

# ---------------------------        VALIDACIONES --------------------------- #

find . -type f -exec chmod 777 {} \;
find listaClientes.txt -type f -exec chmod 555 {} \;

[ ! -r "$ARCHIVO_LISTA_DE_SERVICIOS" ] && echo "ERROR! Sin permiso de lectura en $ARCHIVO_LISTA_DE_SERVICIOS."	&& exit 1

[ ! -w "$ARCHIVO_LISTA_DE_SERVICIOS" ] && echo "ERROR! Sin permiso de escritura $ARCHIVO_LISTA_DE_SERVICIOS."	&& exit 1




# --------------------------------------------------------------------------- #



clear

echo ""

echo -e "${MARRON}        TRABAJO OBLIGATORIO 2o AÑO EMT (2019)"
echo -e "${MARRON}        ESCUELA SUPERIOR DE INFORMATICA GRUPO 2 BG"
echo -e "${MARRON}        Alumnos: Daniel Borche, Marcos Bueno, Eduardo Fabre "
echo "  "


	echo -e "${CYAN}=========Mantenimiento Informatico ================"

	echo ""

	echo -e "\t1) Alta de Servicio"

	echo -e "\t2) Baja de Servicio"

	echo -e "\t3) Modificar lista de Servicio"

	echo -e "\t4) Listar Cliente "

	echo -e "\t5) Listar Servicios "

	echo -e "\t6) Consultas "

	echo -e "\tQ) Salir"

	echo ""

	echo -e "\t Digite una opcion: ${FIN_COL}"

	read OP

	case "$OP" in

			1)
			#Redirecciona al bash de Alta de Servicio
			./AltaServicio.sh
					;;

			2)
			#Redirecciona al bash de Alta de Servicio
			./bajaServicio.sh
					;;
			3)
			#Redirecciona al bash de Alta de Servicio
			./menuModifica.sh
					;;

			4)
			#Redirecciona al bash de buscar cliente
			./listarClientes.sh
					;;
			5)
			#Redirecciona al bash de Alta de Servicio
			./listarServicios.sh
			;;

			6)
			#Redirecciona al bash de Alta de Servicio
			./Consulta.sh
			;;


			q|Q) exit 0     ;;

			*) echo -e "${ROJO}\t Opcion inválida! "

			echo ""

	esac
