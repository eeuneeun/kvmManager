#!/bin/sh
#가상네트워크보기
. ./kvmLib

temp=1
viewTitle="가상컴퓨터리스트"

vListUpdate vpc
vpcListView $viewTitle

while [ $temp ]
do
	dialogCall ${vnetListArray[*]}
	if [ -n $selectNum ]
	then
		echo "DB에 저장된 가상머신 정보 출력"
	else
		temp=0
	fi
done
