#!/bin/bash

psql="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    atomic_number=$1
    element=$($psql "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$atomic_number")
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    symbol=$1
    element=$($psql "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$symbol'")
  else
    element=$($psql "SELECT * FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$1'")
  fi

  if [[ -z $element ]]
  then
    echo "I could not find that element in the database."
  else
    echo $element | sed 's/|/ /g' | while read t a b c d e f g
    do
    echo "The element with atomic number $a is $c ($b). It's a $g, with a mass of $d amu. $c has a melting point of $e celsius and a boiling point of $f celsius."
    done
  fi
fi

