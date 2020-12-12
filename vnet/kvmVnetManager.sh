#!/bin/sh
. ./kvmLib

menuArray=("가상네트워크관리" "가상네트워크생성" "가상네트워크삭제" "가상네트워크상태확인")

while [ 1 ]
do
	dialogCall ${menuArray[*]}

	case $selectNum in 
		1)	#가상 네트워크 생성
			$vnetURL/kvmVnetAdd.sh;;
	
		2)	#가상 네트워크 삭제
			$vnetURL/kvmVnetDel.sh;;
		
		3)	#가상 네트워크 상태확인
			$vnetURL/kvmVnetView.sh;;
		
		*)	#종료
			break;;
	esac
done

