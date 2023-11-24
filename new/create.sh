#!/bin/bash

#Takes in 1 argument - id
#Creating a user

path="Users"

client_pipe="/home/ranya/Desktop/Users/Pipes/$id/client"

#check if the user folder exists- do we need this?
if [ -d "/home/ranya/Desktop/Users" ]; then
	exit 0
else
	mkdir -p "/home/ranya/Desktop/Users"
fi

if [ "$#" -eq 1 ]; then
	arg="$1" #Ranya
	if [ -d "/home/ranya/Desktop/Users/$arg" ]; then #check if user folder already exists
		res1="nok: user already exists"
		echo "$res1" > $client_pipe
		exit 1
	else
		mkdir -p "$path/$arg"
		touch "$path/$arg/wall.txt" 
		touch "$path/$arg/friends.txt"
		#mkfifo "$path/$arg/client" #creates the pipe for the client
		echo "Start_Of_File" >> "$path/$arg/wall.txt"
		echo "$arg" >> "$path/$arg/friends.txt"
		echo "User created successfully" >> $client_pipe
		exit 0
	fi
else
	echo "Usage: $0 <arg>"
	exit 1
fi