#!/bin/bash -x

var="Welcome to tic tac toe game"
echo "$var"

declare -a board
PLAYER=X;
COMPUTER=O;

function InitializingBoard(){
board=(0,0,0,0,0,0,0,0,0)
}

InitializingBoard
