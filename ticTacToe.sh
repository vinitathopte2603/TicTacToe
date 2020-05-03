#!/bin/bash -x

var="Welcome to tic tac toe game"
echo "$var"

declare -a board
NUMBER_OF_ROWS=3
NUMBER_OF_COLUMNS=3

function InitializingBoard(){
board=(0,0,0,0,0,0,0,0,0)
}

InitializingBoard
