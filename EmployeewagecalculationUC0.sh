#!/bin/bash -x

echo "WELCOME To Employee Wage Calculation"


isPresent=1
wagePerHour=20
hrsPerDay=8

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


function dailywage()
{
	if [[ $((RANDOM%2)) -eq $isPresent ]]
	then
		dailySalary=$(($wagePerHour * $hrsPerDay ))
		echo "Salary is.."$dailySalary
	else
		echo "Salary = 0"
	fi
}
dailywage













