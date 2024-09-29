#!/bin/bash


export APP_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${APP_ROOT_PATH}

echo
echo "APP_ROOT_PATH: ${APP_ROOT_PATH}"
echo


pip install -r requirements.txt

gunicorn --reload src.main:app
