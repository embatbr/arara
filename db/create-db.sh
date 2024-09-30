#!/bin/bash


export DB_DIR_ABSPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${DB_DIR_ABSPATH}

echo ${DB_DIR_ABSPATH}


DB_NAME=arara
DB_USER=arara # the owner of this database
DB_PWD=$1


psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};"
psql -U postgres -c "DROP USER IF EXISTS ${DB_USER};"

psql -U postgres -c "CREATE USER ${DB_USER} WITH SUPERUSER ENCRYPTED PASSWORD '${DB_PWD}';"
psql -U postgres -c "CREATE DATABASE ${DB_NAME} WITH OWNER = ${DB_USER};"

./db-up.sh "${DB_NAME}" "${DB_USER}" "${DB_PWD}"
./populate-db.sh "${DB_NAME}" "${DB_USER}" "${DB_PWD}"

PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME}
