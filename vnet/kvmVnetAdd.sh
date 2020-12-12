#!/bin/sh
#가상네트워크생성

. ./kvmLib

menuArray=("가상네트워크생성" "NAT네트워크" "Isolated네트워크")

while [ 1 ]
do
	dialogCall ${menuArray[*]}

	case $selectNum in 
		1)	#NAT네트워크
			vnetAdd nat
			vnetXmlView $vnetFilesURL/$newFileName;;
	
		2)	#Isolated 네트워크
			vnetAdd isolated
			vnetXmlView $vnetFilesURL/$newFileName;;

		*)	#종료
			break;;
	esac
done

