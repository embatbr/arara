#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME=$1
DB_USER=$2
# DB_PWD=$3


domains=("core" "login")
for domain in "${domains[@]}"
do
    echo "Running script 'domains/${domain}.sql'"
    psql -U ${DB_USER} -d ${DB_NAME} -f domains/${domain}.sql
    echo
done
