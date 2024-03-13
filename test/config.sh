#!/bin/bash
set -e

testAlias+=(
	[dashd:trusty]='dashd'
)

imageTests+=(
	[dashd]='
		rpcpassword
	'
)
