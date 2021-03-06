#!/bin/bash

var="Welcome to tic tac toe game"
echo "$var"

declare -a board

GAMESTATUS=1;
NUMBEROFROWS=3;
NUMBEROFCOLUMNS=3;
HEAD=1;
TAIL=0;
BOARD_POSITION=10;
winner=false;
turn=0
player=''
computer=''


function boardInitialisation(){

for (( i=1;i<=$BOARD_POSITION;i++ ))
do
	board[$i]=0
done
}

function printBoard(){

	echo " -------------"
	echo " | "${board[1]}" | "${board[2]}" | "${board[3]}" | "
	echo " -------------"
	echo " | "${board[4]}" | "${board[5]}" | "${board[6]}" | "
	echo " -------------"
	echo " | "${board[7]}" | "${board[8]}" | "${board[9]}" | "
	echo " -------------"
}

function checkHorizontal(){
	numberOfRows=3
	position=1
	counter=1
	while [ $counter -le 3 ]
	do
		if [[ ${board[$position]} == ${board[$position+1]} ]] && [[ ${board[$position+1]} == ${board[$position+2]} ]] && [[ ${board[$position+2]} == $1 ]]
	then
		printBoard
		echo "$1 wins"
		winner=true
		break
	else
		position=$(( $position+$numberOfRows ))
	fi
	counter=$(( $counter+1 ))
	done
}

function checkVertical(){
	numberOfRows=3
	position=1
	counter=1
	while [ $counter -le 3 ]
	do
		if [[ ${board[$position]} == ${board[$position+3]} ]] && [[ ${board[$position+3]} == ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then
			printBoard
			echo "$1 wins"
			winner=true
			break
		else
		position=$(( $position+1 ))
		fi
	counter=$(( $counter+1 ))
	done
}

function checkDiagonal(){

	position=1
	counter=1
	while [ $counter -le 2 ]
	do
		if [[ ${board[$position]} == ${board[$positon+4]} ]] && [[ ${board[$position+4]} == ${board[$position+8]} ]] && [[ ${board[$position+8]} == $1 ]]
		then
		printBoard
		echo "$1 wins"
		winner=true
		break
		elif [[ ${board[$position+2]} == ${board[$position+4]} ]] && [[ ${board[$position+4]} == ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then
		printBoard
		echo "$1 wins"
		winner=true
		break
	fi
	counter=$(($counter+1))
	done

}

function userInput(){
	count=0
	if [ $(($turn%2)) -eq 0 ]
	then

	read -p "Enter your choice : " POSITION
	if [ ${board[$POSITION]} -eq 0 ]
	then
		board[$POSITION]=$player
		printBoard
		turn=$(( $turn + 1 ))
	else
		echo "Enter number between 1 to 10"
		userInput
	fi
	else
	echo "Computer's turn"
	printBoard
	turn=$(( $turn + 1 ))
	fi

}

function ticTacToe(){
	checkToss=$((RANDOM%2))
	if [[ $checkToss -eq $HEAD ]]
then
	player='X'
	computer='O'
	echo "Player plays first"
	printBoard
	userInput

else
	player='O'
	computer='X'
	echo "Computer plays first"
	fi
}

boardInitialisation
ticTacToe

while [ $winner == false ]
do
	printBoard
	userInput
	checkHorizontal $player
	checkVertical $player
	checkDiagonal $player
done
