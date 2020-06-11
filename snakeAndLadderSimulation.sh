#!/bin/bash -x
COUNT=0
currentPosition=0
echo "snake and ladder game"
echo "StartPosition=0"

function rollDie(){
s=$(($RANDOM%6 + 1))
}

function snakeLadderNoplay(){
rollDie
t=$(($RANDOM%3))
case $t in
0)
        currentPosition=$currentPosition
        ;;
1)
        currentPosition=$(($currentPosition + $s))
        ;;
2)
        currentPosition=$(($currentPosition - $s))
        ;;
esac
}
function game(){
while [ $currentPosition -le 100 ]
do
	((COUNT++))
	position=$currentPosition
	snakeLadderNoplay
if [ $currentPosition -lt 0 ]
then
	currentPosition=0
fi
echo "Position of player after dieroll" $COUNT "is" $currentPosition
done
}

function win(){
game
if [ $position -ne 100 ]
then
while [ $currentPosition -ne 100 ]
do
if [ $currentPosition -gt 100 ]
then
currentPosition=$position
fi
((COUNT++))
snakeLadderNoplay
echo "Position of player after die roll" $COUNT "is" $currentPosition
done
echo "player won the match reached" $currentPosition
echo "die rolled for" $COUNT
else
echo "die rolled for" $COUNT "times"
echo "player won the match reached" $position
fi
}
win
