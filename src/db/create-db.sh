#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME=$1
DB_USER=$2
DB_PWD=$3


psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};"
psql -U postgres -c "DROP USER IF EXISTS ${DB_USER};"

psql -U postgres -c "CREATE USER ${DB_USER} WITH ENCRYPTED PASSWORD '${DB_PWD}';"
psql -U postgres -c "CREATE DATABASE ${DB_NAME} WITH OWNER = ${DB_USER};"

./db-up.sh "${DB_NAME}" "${DB_USER}" "${DB_PWD}"
