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
attendance
dailyWage
