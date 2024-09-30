#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME=$1
DB_USER=$2
DB_PWD=$3


domains=("core" "display")
for domain in "${domains[@]}"
do
    echo "Running script 'domains/${domain}.sql'"
    PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME} -f domains/${domain}.sql
    echo
done


users=("feed")
for user in "${users[@]}"
do
    echo "Creating user '${user}'"
    read -s -p "pwd: " -s user_pwd
    PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME} \
        -c "DROP USER IF EXISTS ${user};"
    PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME} \
        -c "CREATE USER ${user} WITH ENCRYPTED PASSWORD '${user_pwd}';"
    echo
done

PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME} -f users.sql
