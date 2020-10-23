#! /bin/bash

wagePerHr=20
isPresent=1
hrsPerDay=8
isFullTime=2
isPartTime=1
partTimeHrs=4
fullTimeHrs=8
noOfWorkingDays=20
totalWorkHrs=0
noOfDays=0
empHrs=0

function attendance()
{
        if [[ $((RANDOM%2)) -eq $isPresent ]]
        then
                echo "Employee is Present"
        else
                echo "Employee Is Absent"
        fi
}

function dailyWage()
{
        if [[ $((RANDOM%2)) -eq $isPresent ]]
        then
                dailySalary=$(($wagePerHr * $hrsPerDay ))
                echo "Salary is.."$dailySalary
        else
                echo "Salary = 0"
        fi
}

function checkPartTime()
{
        if [[ $((RANDOM%3)) -eq $isPartTime ]]
        then
                echo "Employee Is Part Time"
                empHrs=4
        elif [[ $((RANDOM%3)) -eq $isFulltime ]]
        then
                echo "Employee is Full Time"
                empHrs=8
        else
                empHrs=0
        fi
        dailySalary=$(($empHrs * $wagePerHr))
        echo "Salary is.."$dailySalary
}

function usingCase()
{
        random=$((RANDOM%3))
        case $random in
                1)
                dailySalary=$(($partTimeHrs * $wagePerHr ))
                echo "Salary is.."$dailySalary;;
                2)
                dailySalary=$(($fullTimeHrs * $wagePerHr ))
                echo "Salary is.."$dailySalary;;
                *)
                echo "Salary is.. 0";;
esac
}

function wageForMonths()
{
        for (( i=1; i<=$noOfWorkingDays; i++ ))
        do
                random=$((RANDOM%3))
                case $random in
                        1)
                        empHrs=4;;
                        2)
                        empHrs=8;;
                        *)
                        empHrs=0;;
                        esac
                salary=$(($wagePerHr*$empHrs))
               # echo $salary
                totalSalary=$(($totalSalary + $salary ))
done
echo "Total Wage of Month is : "$totalSalary
}

function findHrs()
{
        while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
        do
      random=$((RANDOM%3))
      case $random in
         1)
         empHrs=4 ;;
         2)
         empHrs=8 ;;
         *)
         empHrs=0 ;;
       esac
        ((noOfDays++))
        totalWorkHrs=$(( $totalWorkHrs + $empHrs ))
        ((totalWorkHrs++))

   done
echo "Working Hours of the month is $totalWorkHrs"
}

function getWorkingHrs()
{
    while [[ $(($totalWorkHrs + $empHrs)) -lt 100 ]]
do
    local empHours
        empHours=$((RANDOM%3))
                case $empHours in
                        1)
                        empHrs=4;;
                        2)
                        empHrs=8;;
                        *)
                        empHrs=0;;
                        esac
        totalWorkHrs=$(( $totalWorkHrs + $empHrs ))
        ((totalWorkHrs++))
done
echo "Total Work Hours"  $totalWorkHrs
}
attendance
dailyWage
checkPartTime
usingCase
wageForMonths
findHrs
getWorkingHrs
