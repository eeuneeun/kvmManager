#!/bin/sh

MYSQL=$(which mysql)
statement="insert into vmnet values ('a','b','c','d')"
$MYSQL kvm -u root -ptest123 <<EOF
	$statement
EOF
		echo "데이터가 성공적으로 작성되었습니다."
	
	
		echo "데이터 추가에 문제가 발생했습니다."
		echo "데이터를 총 4개까지만 입력해 주십시오."
	
#}


#insertVnet;
