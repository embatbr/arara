#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${PROJECT_ROOT_PATH}


DB_NAME=$1
DB_USER=$2
DB_PWD=$3


PGPASSWORD=${DB_PWD} psql -U ${DB_USER} -d ${DB_NAME} -f populate-db.sql
