#!/bin/bash

# Simple script to do a db dump/backup of a specific database
# Just change the "db_name" variable to get started
#
db_name=db_name

folder=~/backups/mysql/$(date -d "today" +"%Y-%m-%d")
mkdir -p $folder
mysqldump -u root -p $db_name > $folder/$db_name.sql
