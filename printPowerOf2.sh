#! /bin/bash -x

#take input n and print table of powers of 2.

echo "Type a number N:"
read $n
x=0
while[ $x -le $n ]
do
	echo $( 2^$n )
	x++
done
