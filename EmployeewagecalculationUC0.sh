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

declare -a dailyWage

function attendence()
{

	if [[ $((RANDOM%2)) -eq $isPresent ]]
	then
		echo "Employee is Present"
	else
		echo "Employee is Absent"
	fi
}
#attendence


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
#dailywage

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
#checkPartTime


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
#usingCase

function findHrs()		# Use Case 6 Refactored Here For Output of Use Case 7
{
      random=$((RANDOM%3))
      case $random in
         1)
         empHrs=4 ;;
         2)
         empHrs=8 ;;
         *)
         empHrs=0 ;;
       esac
		echo $empHrs
}

function wageCalculate() # Use Case 7 Refactored
{
	empHours=$1
	wage=$(($wagePerHr * $empHours))
	echo  $wage
}

#Uc8
function wageForMonth() # Use Case 5 Refactored
{
   while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
	do
		((noOfDays++))
		empHrs=$(findHrs $((RANDOM%3)) )
		totalWorkHrs=$(($totalWorkHrs + $empHrs ))
      dailyWage[noOfDays]=$(wageCalculate $empHrs )
   done
totalSalary=$(($totalWorkHrs * $wagePerHr))
echo "Daily Wage.."${dailyWage[@]}
echo "Day numbers.."{!dailyWages[@]}
echo "Total Wage of Month.."$totalSalary
}
wageForMonth
