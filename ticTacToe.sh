#!/bin/bash -x

var="Welcome to tic tac toe game"
echo "$var"

declare -a board
PLAYER=X;
COMPUTER=O;
HEAD=1;
TAIL=0;

board=(0,0,0,0,0,0,0,0,0)

checkToss=$((RANDOM%2))
if [[ $checkToss == $HEAD ]]
then
	echo "Player plays first"
else
	echo "Computer plays First"
fi
