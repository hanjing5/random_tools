#!/bin/bash

# Simple script to do a db dump/backup of a specific database
folder=~/backups/mysql/$(date -d "today" +"%Y-%m-%d")
db_name=db_name
mkdir -p $folder
mysqldump -u root -p $db_name > $folder/$db_name.sql
