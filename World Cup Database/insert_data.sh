#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

QUERY_RESULT="$($PSQL "TRUNCATE TABLE teams,games;" )"
echo "$QUERY_RESULT"

while IFS="," read  YEAR ROUND WINNER OPPONENT WGOALS LGOALS
do
  if [[ $YEAR == "year" ]] 
  then 
    continue
  fi

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")

  if [[ -z $WINNER_ID ]]
  then
    QUERY_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  fi

  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

  if [[ -z $OPPONENT_ID ]]
  then
    QUERY_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  fi
  
   QUERY_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
   VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $LGOALS);")

done < games.csv

