#!/usr/bin/env bash

#-------------------------------------------------------------------------- VARIABLES ------------------------------------------------------------------------

ROJO="\033[31;1m"
VERDE="\033[0;32m"
FIN_COL="\033[0m"
OP=

#------------------------------------------------------------------------------------------------------------------------------------------------------------

clear
echo ""
echo -e  "${VERDE}======================================================= MENU CONSULTAS ===================================================================="
echo""

echo -e "\t1) Cantidad de servicios realizados en un mes a un cliente"
echo -e "\t2) Importe total de compras de un cliente"
echo -e "\t3) Clientes que recibieron servicios en un mes"
echo -e "\t4) Cantidad de ventas de un determinado usuario en un mes"
echo -e "\t5) Importe total de ventas en un mes"
echo -e "\tV) Volver al Menu Principal"
echo ""
echo -e "\t Digite una opcion: ${FIN_COL}"
read OP
case "$OP" in
	1)
		#Redirecciona al bash de CantServicios.sh
		./CantServicios.sh
		;;

	2)
		#Redirecciona al bash de ImpTotalCliente.sh
		./importeTotalCliente.sh
		;;

	3)
		#Redirecciona al bash de NomClixmes.sh
		./NomClixmes.sh
		;;

	4)
		#Redirecciona al bash de CantVtaUsrxmes.sh
		.\CantVtaUsrxmes.sh
		;;

	5)
		#Redirecciona al bash de ImpTotalxmes.sh
		./ImpTotalxmes.sh
		;;

	v|V) #Redirecciona al Menu Principal
		./menu.sh
		;;

	*) echo -e "${ROJO}\t Opcion incorrecta "
		sleep 3
		
		./Consulta.sh
esac
