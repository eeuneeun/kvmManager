#!/bin/sh
. ./kvmLib


$DBConnect <<EOF
	insert into vnet values ("$1","$2","$3","$4")
EOF
