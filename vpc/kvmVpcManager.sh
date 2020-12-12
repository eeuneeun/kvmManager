#!/bin/sh
. ./kvmLib

menuArray=("가상머신관리" "가상컴퓨터생성" "가상컴퓨터삭제" "가상컴퓨터상태확인")

while [ 1 ]
do
	dialogCall ${menuArray[*]}

	case $selectNum in 
		1)	#가상 컴퓨터 생성
			$vpcURL/kvmVpcAdd.sh;;
	
		2)	#가상 컴퓨터 삭제
			$vpcURL/kvmVpcDel.sh;;
		
		3)	#가상 컴퓨터 상태확인
			$vpcURL/kvmVpcView.sh;;
		
		*)	#종료
			break;;
	esac
done

