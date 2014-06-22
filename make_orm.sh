#!/bin/bash
# grep -o = only matching

CONFIG_FILE="ace_expert.conf"

LOGIN=$(grep 'login' $CONFIG_FILE | grep -o -E '"\b(\w+)"'| sed -e 's/^"//'  -e 's/"$//')
PASSWORD=$(grep 'password' $CONFIG_FILE | grep -o -E '"\b(\w+)"' | sed -e 's/^"//'  -e 's/"$//')
DB=$(grep 'database' $CONFIG_FILE | grep -o -E '"\b(\w+)"' | sed -e 's/^"//'  -e 's/"$//')
DB_TYPE=$(grep 'db_type' $CONFIG_FILE | grep -o -E '"\b(\w+)"' | sed -e 's/^"//'  -e 's/"$//')
HOST=$(grep 'host' $CONFIG_FILE | grep -o -E '"\b(\w+)"' | sed -e 's/^"//'  -e 's/"$//' )
PORT=$(grep 'port' $CONFIG_FILE | grep -o -E '([0-9]+)' | sed -e 's/^"//'  -e 's/"$//' )

APP_MODULE=$(cd lib && ls | grep '.pm')
APP_NAME="${APP_MODULE%%.*}"

echo $APP_NAME::Schema 'dbi:'$DB_TYPE':database='$DB';host='$HOST';port='$PORT $LOGIN $PASSWORD

cd lib
dbicdump $APP_NAME::Schema 'dbi:'$DB_TYPE':database='$DB';host='$HOST';port='$PORT $LOGIN $PASSWORD
