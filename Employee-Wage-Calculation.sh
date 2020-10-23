#! /bin/bash

isPresent=1

function attendance()
{
        if [[ $((RANDOM%2)) -eq $isPresent ]]
        then
                echo "Employee is Present"
        else
                echo "Employee Is Absent"
        fi
}
attendance
