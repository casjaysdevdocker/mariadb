#!/usr/bin/env bash

echo "Creating MySQL user and database"

DB="$1"
PASS=$2
USER="$DB"
if [ -z "$2" ]; then
  PASS=$(cat /dev/urandom | tr -dc 'A-Za-z0-9_@!' | tr -d '[:space:]\042\047\134' | fold -w '20' | head -n 1)
  echo "$PASS" >/config/mysql_pass
fi

mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $DB;
CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user and database created."
echo "Database:   $DB"
echo "Username:   $USER"
echo "Password:   $PASS"
