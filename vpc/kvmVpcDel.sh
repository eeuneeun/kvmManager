#!/bin/sh
#가상머신삭제

. ./kvmLib

temp=1
delTitle="삭제할가상머신선택"
vListUpdate vpc
vpcListView $delTitle

while [ $temp ]
do
	dialogCall ${vnetListArray[*]}
	if [ -n $selectNum ] && [[ $selectNum =~ $isNum ]]
	then
		vpcDel	${vnetListArray[$selectNum]}	
		vListUpdate vpc
		vpcListView $delTitle
	else
		temp=0	
		
	fi
done
