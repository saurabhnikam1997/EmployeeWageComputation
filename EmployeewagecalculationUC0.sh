#!/bin/bash -x

echo "WELCOME To Employee Wage Calculation"


isPresent=1
wagePerHr=20
hrsPerDay=8

partTimeHrs=4
fullTimeHrs=8

isPartTime=1
isFullTime=2
empHrs=0

noOfWorkingDays=20
totalWorkHrs=0
noOfDays=0

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


function usingCase()
{
	random=$((RANDOM%3))
	case $random in
			1)
			dailySalary=$(($partTimeHrs * $wagePerHr ))
			echo "Salary is.."$dailySalary
			;;
			2)
         		dailySalary=$(($fullTimeHrs * $wagePerHr ))
         		echo "Salary is.."$dailySalary
         		;;
			*)
			echo "Salary is.. 0"
			;;
	esac
}
usingCase


function wageForMonth()
{
	for (( i=1; i<=$noOfWorkingDays; i++ ))
	do
		random=$((RANDOM%3))
		case $random in
			1)
			empHrs=4
			;;
			2)
			empHrs=8
			;;
			*)
			empHrs=0
			;;
			esac
		salary=$(($wagePerHr*$empHrs))
		echo $salary
		totalSalary=$(($totalSalary + $salary ))
	done
echo "Total Wage of Month.."$totalSalary
}
wageForMonth

function tillMaxHrs()
{
	while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
	do
      random=$((RANDOM%3))
      case $random in
         1)
         empHrs=4
         ;;
         2)
         empHrs=8
         ;;
         *)
         empHrs=0
         ;;
       esac
	((noOfDays++))
	totalWorkHrs=$(($totalWorkHrs+$empHrs))
      salary=$(($wagePerHr*$empHrs))
      totalSalary=$(($totalSalary + $salary ))
   done
echo "Total Wage of Month.."$totalSalary
}
tillMaxHrs
