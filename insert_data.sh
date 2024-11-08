#! /bin/bash
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\n~~ Insert Data ~~"


#Insere Times
echo -e "\nInsere Times"
cat games.csv | while IFS="," read year round winner opponent winner_goals
do
#Insere Vencedores
  if [[ $winner != winner ]]
  then
    WINNER_GET_ID=$($PSQL "select team_id from teams where name = '$winner'")
    if [[ -z $WINNER_GET_ID ]]
    then
      WINNER_INSERT=$($PSQL "insert into teams (name) values ('$winner')")
      if [[ $WINNER_INSERT == "INSERT 0 1" ]]
        then
          echo "$winner inserido na tabela teams"
        fi
    else
      echo "$winner já existe na tabela teams"
    fi
  fi

#Insere Oponentes
if [[ $opponent != opponent ]]
  then
    OPPONENT_GET_ID=$($PSQL "select team_id from teams where name = '$opponent'")
    if [[ -z $OPPONENT_GET_ID ]]
    then
      OPPONENT_INSERT=$($PSQL "insert into teams (name) values ('$opponent')")
      if [[ $OPPONENT_INSERT == "INSERT 0 1" ]]
        then
          echo "$opponent inserido na tabela teams"
        fi
    else
      echo "$opponent já existe na tabela teams"
    fi
  fi
done

#Insere Partidas
echo -e "\nInsere Partidas"
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals;
do
  if [[ $winner != winner ]]
  then
    #Obtém ID do Vencedor
    WIN_ID=$($PSQL "select team_id from teams where name = '$winner'")
    #Obtém ID do Oponente
    OP_ID=$($PSQL "select team_id from teams where name = '$opponent'")
    #Insere partida
    echo $($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($year, '$round', $WIN_ID, $OP_ID, $winner_goals, $opponent_goals)")
  fi
done