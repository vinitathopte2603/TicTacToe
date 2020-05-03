#!/bin/bash

var="Welcome to tic tac toe game"
echo "$var"

declare -a board
PLAYER=X;
COMPUTER=O;
HEAD=1;
TAIL=0;
BOARD_POSITION=10;

for (( i=1;i<=$BOARD_POSITION;i++ ))
do
	board[$i]=0
done

function printBoard(){

	echo " -------------"
	echo " | "${board[1]}" | "${board[2]}" | "${board[3]}" | "
	echo " -------------"
	echo " | "${board[4]}" | "${board[5]}" | "${board[6]}" | "
	echo " -------------"
	echo " | "${board[7]}" | "${board[8]}" | "${board[9]}" | "
	echo " -------------"
}

function userInput(){

	read -p "Enter your choice : " POSITION
	if [ $POSITION -gt 10 ]
	then
		echo "Invalid Input"
	fi
	board[$POSITION]=$PLAYER
	printBoard

}

function ticTacToe(){
checkToss=$((RANDOM%2))
if [[ $checkToss == $HEAD ]]
then
	echo "Player plays first"
	printBoard
	userInput
else
	echo "Computer plays First"
	printBoard
fi
}
ticTacToe
