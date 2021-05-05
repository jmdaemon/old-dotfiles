#!/bin/bash

RANGE=5
number=$RANDOM
#echo $number
#let "number %= $RANGE"
#echo "Random number less than $RANGE  ---  $number"


# For our purposes we can accept 0 values
# May combine above two techniques to retrieve random number between two limits.
FLOOR=0
number=0   #initialize
while [ "$number" -le $FLOOR ]
do
  number=$RANDOM
  let "number %= $RANGE"  # Scales $number down within $RANGE.
done
echo "Random number between $FLOOR and $RANGE ---  $number"
