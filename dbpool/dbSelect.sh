#!/bin/sh
. ./kvmLib

if [ -z $1 ]
then

$DBConnect <<EOF
		select * from vnet
EOF

else

$DBConnect <<EOF
		select * from vnet where nettype="$1"
EOF


fi



	
