#!/bin/sh
#가상네트워크보기
. ./kvmLib

viewTitle="가상컴퓨터리스트"

vListUpdate vpc
vpcListView $viewTitle

while [ 1 ]
do
	dialogCall ${vpcListArray[*]}
	if [ -n $selectNum ] && [[ $selectNum =~ $isNum ]]
	then
		vpcControl ${vpcListArray[$selectNum]}
		
	else
		exit
	fi
done
