#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME='bemtevi'
DB_USER='bemtevi'
DB_PWD='bemtevi'


psql -U ${DB_USER} -d ${DB_NAME} -f populate-db.sql

psql -U ${DB_USER} -d ${DB_NAME}
