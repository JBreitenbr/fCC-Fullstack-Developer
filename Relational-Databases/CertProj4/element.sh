#!/bin/bash

# Database connection
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ $1 ]]
then
 if [[ $1 =~ ^[0-9]+$ ]]
 then
 ELEMENT_INFO=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$1")
 else 
 ELEMENT_INFO=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE name='$1' OR symbol='$1'")
 fi
 if [[ -z $ELEMENT_INFO ]]
 then
  echo "I could not find that element in the database."
 else
  echo $ELEMENT_INFO | while IFS=\| read ATOMIC_N ATOMIC_M MELT_C BOIL_C SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_N is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_M amu. $NAME has a melting point of $MELT_C celsius and a boiling point of $BOIL_C celsius."
  done
 fi


else
   echo "Please provide an element as an argument."
fi
