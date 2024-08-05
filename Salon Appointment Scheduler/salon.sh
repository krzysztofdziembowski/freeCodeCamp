#!/bin/bash
psql="psql --username=freecodecamp --dbname=salon -t -c";

services=$($psql "SELECT * FROM services")

echo -e "\n~~~ Welcome to the hair salon ~~~";

MAIN_MENU() 
{
  echo -e "\nChoose service:"
  echo "$services" | while read id bar name
  do
    echo "$id) $name"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU
    return
  fi

  service_id=$($psql "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $service_id ]]
  then
    MAIN_MENU
  else
    FILL_DATA $service_id
  fi
}

FILL_DATA()
{
  echo -e "\nEnter phone number"
  read CUSTOMER_PHONE;
  customer_id=$($psql "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo $customer_id
  if [[ -z $customer_id ]]
  then
    echo -e "\nEnter name:"
    read CUSTOMER_NAME
    insert=$($psql "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    customer_id=$($psql "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  
  echo -e "\nEnter time:"
  read SERVICE_TIME
  insert=$($psql "INSERT INTO appointments(customer_id, service_id, time) VALUES ($customer_id, $service_id, '$SERVICE_TIME')")
  service_name=$($psql "SELECT name FROM services WHERE service_id=$service_id")
  customer_name=$($psql "SELECT name FROM customers WHERE customer_id=$customer_id")
  
  echo "I have put you down for a$service_name at $SERVICE_TIME,$customer_name."
}

MAIN_MENU

