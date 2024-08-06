#!/bin/bash

psql="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read username
user_id=$($psql "SELECT user_id FROM users WHERE username='$username'")

if [[ -z $user_id ]]
then
  insert=$($psql "INSERT INTO users(username) VALUES ('$username')")
  user_id=$($psql "SELECT user_id FROM users WHERE username='$username'")
  echo "Welcome, $username! It looks like this is your first time here."
else
  games_played=$($psql "SELECT guess_count FROM games WHERE user_id=$user_id" | wc -l)
  best_game=$($psql "SELECT MIN(guess_count) FROM games WHERE user_id=$user_id")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo "Guess the secret number between 1 and 1000:"

secret=$((RANDOM % 1001))
count=0

while true
do
  read guess
  
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
     echo "That is not an integer, guess again:"
     continue
  fi

  ((count++))

  if [[ $guess -gt $secret ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $guess -lt $secret ]]
  then
    echo "It's higher than that, guess again:"
  else
    insert=$($psql "INSERT INTO games (user_id, guess_count) VALUES ($user_id, $count)")
    echo "You guessed it in $count tries. The secret number was $secret. Nice job!"
    break
  fi
done

