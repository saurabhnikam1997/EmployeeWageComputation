#!/bin/bash -x

echo "WELCOME To Employee Wage Calculation"


isPresent=1
wagePerHr=20
hrsPerDay=8
isPartTime=1
isFullTime=2
empHrs=0


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
		dailySalary=$(( $wagePerHr * $hrsPerDay ))
		echo "Salary is.."$dailySalary
	else
		echo "Salary = 0"
	fi
}
dailywage

function checkPartTime()
{
	if [[ $((RANDOM%3)) -eq $isPartTime ]]
	then
		echo "Employee Is Part Time"
		empHrs=4
	elif [[ $((RANDOM%3)) -eq $isFullTime ]]
	then
		echo "Employee Is Full Time"
		empHrs=8
	else
		empHrs=0
	fi
	dailySalary=$(($empHrs * $wagePerHr))
	echo "Salary is.."$dailySalary
}
checkPartTime








