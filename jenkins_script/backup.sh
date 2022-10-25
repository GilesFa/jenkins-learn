#!/bin/bash

DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP=$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5
#BUCKET_NAME=jenkins-mysql-backup1025

mysqldump -uroot -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIASIRBAVW53FUBGZC6 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your db backup..." && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP
