#!/bin/sh
#가상네트워크삭제

. ./kvmLib

delTitle="삭제할네트워크선택"
vListUpdate vnet
vnetListView $delTitle

while [ 1 ]
do
	dialogCall ${vnetListArray[*]}
	if [ -n $selectNum ] && [[ $selectNum =~ $isNum ]]
	then
		vnetDel	${vnetListArray[$selectNum]}	
		vListUpdate vnet
		vnetListView $delTitle
		dialogCall ${vnetListArray[*]}
	else
		exit
	fi
done
