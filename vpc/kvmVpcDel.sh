#!/bin/sh
#가상머신삭제
. ./kvmLib

delTitle="삭제할가상머신선택"
vListUpdate vpc
vpcListView $delTitle

while [ 1 ]
do
	dialogCall ${vpcListArray[*]}
	if [ -n $selectNum ] && [[ $selectNum =~ $isNum ]]
	then
		vpcDel ${vpcListArray[$selectNum]}
		vListUpdate "vpc"
		vpcListView $delTitle
	else
		exit
	fi
done
