#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_PWD=$1


psql -U postgres -c "DROP DATABASE IF EXISTS bemtevi;"
psql -U postgres -c "DROP USER IF EXISTS bemtevi;"

psql -U postgres -c "CREATE USER bemtevi WITH ENCRYPTED PASSWORD '${DB_PWD}';"
psql -U postgres -c "CREATE DATABASE bemtevi WITH OWNER = bemtevi;"

psql -U bemtevi -f create-db.sql

psql -U bemtevi
