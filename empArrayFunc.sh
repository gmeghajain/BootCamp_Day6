#! /bin/bash -x

IS_PART_TIME=1
IS_FULL_TIME=2
EMP_RATE_PER_HR=20
MAX_HRS_IN_MONTH=50
NUM_WORKING_DAYS=20

totalEmpHR=0
totalWorkingDays=0


#function
function getWorkingHours(){

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
function getEmpWage() {
	local empHr=$1
	echo $(( $empHr*$EMP_RATE_PER_HR ))
}

while [[ $totalEmpHR -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
      ((totalWorkingDays++))
      workHours="$( getWorkingHours $((RANDOM%3)) )"
		totalworkHours=$(( $totalEmpHR + $workHours ))
      dailywages[$totalWorkingDays]="$( getEmpWage $workHours )"
done
salary=$(($EMP_RATE_PER_HR*$totalEmpHR))
echo "the salary is $salary";
echo ${!dailywages[@]};
echo ${dailywages[@]};

