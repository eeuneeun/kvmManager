#!/bin/sh
. ./kvmLib

menuArray=("KVM_MANAGER" "가상네트워크관리" "가상머신관리")
while [ 1 ]
do
	dialogCall ${menuArray[*]}

	case $selectNum in 
		1)	#가상 네트워크 관리
			$vnetURL/kvmVnetManager.sh;;
	
		2)	#가상 머신 관리
			$vpcURL/kvmVpcManager.sh;;

		*)	#종료
			break;;
	esac
done


