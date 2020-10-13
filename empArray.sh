#! /bin/bash

IS_PART_TIME=1
IS_FULL_TIME=2
EMP_RATE_PER_HR=20
MAX_HRS_IN_MONTH=50
NUM_WORKING_DAYS=20

totalEmpHR=0
totalWorkingDays=0


#function
function getworkinghour(){

local empHrs=0;

         case $1 in
            $IS_FULL_TIME )
                              empHrs=8;;
            $IS_PART_TIME )
                              empHrs=4;;
            *)
                           empHrs=0;;
         esac

echo $empHrs

}
function grtEmpWage() {
	local empHr=$1
	echo $(($empHR*$EMP_RATE_PER_HR))
}

while [[ $totalEmpHR -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt 
$NUM_WORKING_DAYS ]] do
      ((totalWorkingDays++))
      employeeCheck=$((RANDOM%3))

      empHrs=$( getworkinghour $employeeCheck )

      totalEmpHR=$(($totalEmpHR+$empHrs))
      dailywages[$totalWorkingDays]="$( getEmpWage $empHrs )"
done
salary=$(($EMP_RATE_PER_HR*$totalEmpHR))
echo "the salary is $salary";
echo ${!dailywages[@]};
echo ${dailywages[@]};
