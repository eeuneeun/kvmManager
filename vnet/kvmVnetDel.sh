#!/bin/sh
#가상네트워크삭제

. ./kvmLib

temp=1
delTitle="삭제할네트워크선택"
vListUpdate vnet
vnetListView $delTitle

while [ $temp ]
do
	dialogCall ${vnetListArray[*]}
	if [ -n $selectNum ] && [[ $selectNum =~ $isNum ]]
	then
		vnetDel	${vnetListArray[$selectNum]}	
		vListUpdate vnet
		vnetListView $delTitle
	else
		temp=0	
		
	fi
done
