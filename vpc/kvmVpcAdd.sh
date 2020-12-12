#!/bin/sh
#가상머신생성

. ./kvmLib

menuArray=("가상머신생성" "기본값으로생성" "원하는사양으로생성")

while [ 1 ]
do
	dialogCall ${menuArray[*]}

	case $selectNum in 
		1)	#기본값으로생성
			#virt-install --name test$timeStamp --vcpus 1 --ram 1024 --disk path=$vpcImgURL/test.img,size=5 --graphics vnc,port=5901 --cdrom /storage/vyos-1.1.8-amd64.iso;;	
			#클라우드 이름 입력받기
			newCName=$(zenity --entry --text "클라우드 이름을 입력하세요!" --title "새 클라우드 만들기" --entry-text="");
			
			#가상머신 생성
			qemu-img create -f raw -o size=10 $vpcDiskURL/$newCName.img
			
			#기본 클라우드 이미지 복사
			cp $vpcImgURL/CentOS-CloudImg.qcow2 $vpcImgURL/CentOS-$newCName.qcow2
			#포트
			portNum=$[$portNum+1]

			virt-install --import --name $newCName --vcpu 1 --ram 1024 --graphics vnc --network bridge=virbr0 --disk path=$vpcImgURL/CentOS-$newCName.qcow2;;

			
		2)	#원하는사양으로생성

			#클라우드 이름 입력받기
			newCName=$(zenity --entry --text "클라우드 이름을 입력하세요!" --title "새 클라우드 만들기" --entry-text="");

			#새 가상 머신 생성
			execStr="virt-install --import "
			execStr="$execStr--name $newCName "

			#CPU 갯수 입력받기
			cpuNum=$(zenity --entry --text "CPU 갯수를 입력하세요!" --title "CPU 갯수" --entry-text="");
			execStr="$execStr--vcpus $cpuNum "
			
			#RAM 크기 입력받기
			ramSize=$(zenity --entry --text "RAM 크기를 입력하세요!" --title "RAM 크기" --entry-text="");
			portNum=$[$portNum+1]
			execStr="$execStr--ram $ramSize --graphics vnc --network bridge=virbr0 --disk path=$vpcImgURL/CentOS-$newCName.qcow2 "
	
			#가상 디스크 설치 여부
			zenity --question --width 300 --text "생성된 가상 머신에 디스크를 할당하시겠습니까?";


			flag=$(echo $?)
			echo $flag
			
			if [ $flag -eq 1 ]
			then
				zenity --info --width 300 --text "가상 디스크 생성 없이 진행합니다!"
			else
				diskSize=$(zenity --entry --text "디스크 크기를 입력해주세요!" --title "새 가상 디스크 만들기" --entry-text="");
				execStr="$execStr--disk $vpcDiskURL/$newCName.img"
				zenity --info --width 300 --text "가상 디스크가 생성되었습니다!"
			fi

		
			zenity --question --width 300 --text "다음과 같이 설치를 진행하시겠습니까?
			클라우드 이름 : $newCName
			CPU : $cpuNum
			RAM : $ramSize
			DISK : $diskSize";
			
			flag=$(echo $?)
			echo $flag

			if [ $flag -eq 1 ]
			then
				echo "설치를 취소합니다!"
				
			else

				#기본 클라우드 이미지 복사
				cp $vpcImgURL/CentOS-CloudImg.qcow2 $vpcImgURL/CentOS-$newCName.qcow2
				
				#새 가상 머신용 디스크 생성
				qemu-img create -f raw -o size=$(echo $diskSize"G") $vpcDiskURL/$newCName.img
				
				$execStr
		
				#virt-manager 실행
				virt-manager
			fi;;

		*)
			#종료
			break;;
	esac
done

