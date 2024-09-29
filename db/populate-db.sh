#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME='arara'
DB_USER='arara'
DB_PWD='arara'


psql -U ${DB_USER} -d ${DB_NAME} -f populate-db.sql

psql -U ${DB_USER} -d ${DB_NAME}
