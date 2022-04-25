#!/bin/bash -x

counter=0
Dict[0]=$((RANDOM%6+1))
maxCounter=0
#---------------------------------To roll the Dice till any number reached 10 times----------------------------------
for ((i=1;i<=60;i++))
do
	Dice=$((RANDOM%6+1))
	Dict[$i]=$Dice

	for ((j=0;j<i;j++))
	do
		if [ $((Dict[i])) -eq $((Dict[j])) ]
		then
			counter=$((counter+1))
		fi
	done
	if [ $counter -eq 10 ]
	then
		break
	else
		counter=0
	fi
done
#--------------------------------To find the no. that reached maximum times------------------------------------------
DictLen=${#Dict[@]}
for ((i=0;i<DictLen;i++))
do
	counter=1
	for ((j=i+1;j<DictLen;j++))
	do
		if [ $((Dict[i])) -eq $((Dict[j])) ]
		then
			counter=$((counter+1))
		fi
	done

	if [ $maxCounter -lt $counter ]
	then
		maxCounter=$counter
		maxElement=${Dict[i]}
	fi
done
#--------------------------------To find the no. that reached minimum times------------------------------------------
minCounter=$maxCounter
for ((i=0;i<DictLen;i++))
do
	counter=0
        for ((j=1;j<DictLen;j++))
        do
                if [ $((Dict[i])) -eq $((Dict[j])) ]
                then
                        counter=$((counter+1))
                	temp=$counter
		fi
        done

        if [ $minCounter -gt $temp ]
        then
                minCounter=$temp
                minElement=${Dict[i]}
        fi
done

echo "Dictionary elements are:" ${Dict[@]}
echo "Number that reached maximum time is: $maxElement count: $maxCounter"
echo "Number that reached minimum time is: $minElement count: $minCounter"

