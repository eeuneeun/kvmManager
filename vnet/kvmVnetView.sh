#!/bin/sh
#가상네트워크상태확인
. ./kvmLib

temp=1
viewTitle="가상네트워크리스트"

vListUpdate vnet
vnetListView $viewTitle

while [ $temp ]
do
	dialogCall ${vnetListArray[*]}
	if [ -n $selectNum ]
	then
		vnetXmlView $vnetFilesURL/${vnetListArray[$selectNum]}.xml	
		
	else
		temp=0
	fi
done
