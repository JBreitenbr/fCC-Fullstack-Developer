#!/bin/bash 

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_TO_GUESS=$(( RANDOM % 1001 ))
#echo "$NUMBER_TO_GUESS"

echo "Enter your username:"
read USERNAME 

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # get user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # get info about existing user
  USER_INFO=$($PSQL "SELECT COUNT(*), MIN(number_guesses) FROM games WHERE user_id=$USER_ID")
  echo $USER_INFO | while IFS=\|
  read NUMBER_GAMES BEST_GUESS
  do
    echo "Welcome back, $USERNAME! You have played $NUMBER_GAMES games, and your best game took $BEST_GUESS guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS_NUMBER
# initial count of guesses
GUESS_CNT=1
while [[ $GUESS_NUMBER != $NUMBER_TO_GUESS ]]
do
  # check if entry is numeric
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
    read GUESS_NUMBER
  else
    if [[ $GUESS_NUMBER > $NUMBER_TO_GUESS ]]
    then
      echo "It's lower than that, guess again:"
      read GUESS_NUMBER 
      GUESS_CNT=$(( $GUESS_CNT + 1))
    else 
      echo "It's higher than that, guess again:"
      read GUESS_NUMBER
      GUESS_CNT=$(( $GUESS_CNT + 1))
    fi
  fi
done

echo "You guessed it in $GUESS_CNT tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

# add into database
GAME_RESULT=$($PSQL "INSERT INTO games(user_id,number_guesses) VALUES($USER_ID,$GUESS_CNT)")
