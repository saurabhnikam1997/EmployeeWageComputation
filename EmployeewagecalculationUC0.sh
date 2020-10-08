#!/bin/bash -x

echo "WELCOME To Employee Wage Calculation"


isPresent=1

function attendence()
{
	random=$((RANDOM % 2 ))
	if [[ $random -eq $isPresent ]]
	then
		echo "Employee is Present"
	else
		echo "Employee is Absent"
	fi
}
attendence  
