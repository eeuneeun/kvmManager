#!/bin/sh
. ./kvmLib

$DBConnect <<EOF
		delete from vnet where netname="$1"
EOF



	
