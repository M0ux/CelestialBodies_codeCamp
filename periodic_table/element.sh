if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  NUMBER_PATTERN='^[0-9]+$'
  if [[ $1 =~ $NUMBER_PATTERN ]]
  then
    WHERE_CLAUSE="e.atomic_number = $1"
  else
    WHERE_CLAUSE="e.symbol = '$1'or e.name = '$1'"
  fi
  SELECT_ELEMENT=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type from elements e inner join properties p on e.atomic_number = p.atomic_number inner join types t on t.type_id = p.type_id where $WHERE_CLAUSE")
  if [[ -z $SELECT_ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$SELECT_ELEMENT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINTS BOILING_POINT TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINTS celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi