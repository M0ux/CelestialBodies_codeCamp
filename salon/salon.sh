#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
MAIN_MENU(){
if [[ $1 ]]
then
  echo -e "\n$1"
else
  echo -e "\n~~~~~ MY SALON ~~~~~"
  echo -e "\nWelcome to My Salon, how can I help you?"
fi
SERVICES=$($PSQL "select * from services")
echo "$SERVICES" | while IFS="|" read service_id service
do
  echo "$service_id) $service"
done
read SERVICE_ID_SELECTED
CHECK_SERVICE_INPUT=$($PSQL "select * from services where service_id=$SERVICE_ID_SELECTED")
if [[ -z $CHECK_SERVICE_INPUT ]]
then
  MAIN_MENU "I could not find that service. What would you like today?"
else
  FIND_CLIENT "$CHECK_SERVICE_INPUT"
fi
}
FIND_CLIENT(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CHECK_CUSTOMER=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CHECK_CUSTOMER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "insert into customers (phone, name) values ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CHECK_CUSTOMER=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE'")
  fi
  MAKE_APPOINTMENT "$1 | $CHECK_CUSTOMER"
}
MAKE_APPOINTMENT(){
  data=($(echo $1 | tr "|" " "))
  echo -e "\nWhat time would you like your ${data[1]}, ${data[4]}?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "insert into appointments (customer_id, service_id, time) values (${data[2]}, ${data[0]}, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a ${data[1]} at $SERVICE_TIME, ${data[4]}."
}

MAIN_MENU