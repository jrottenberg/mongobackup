# Mongo backup

[![Docker Repository on Quay](https://quay.io/repository/jrottenberg/mongobackup/status "Docker Repository on Quay")](https://quay.io/repository/jrottenberg/mongobackup)

## Operations
Two modes of operation

### Crond

Run as a deployment, [supercronic](https://github.com/aptible/supercronic) inside the container will initiates the backup

choose CRON=hourly|daily|weekly
I use minutely for my test.

### Standalone
Run as a job trigger , executes /backup.sh directly



## Environment variables

- MONGO_SERVER=mongodb
- PREFIX=backup/mongo
- S3_BUCKET

CRON=hourly|daily|weekly (or not set to run standalone command)

Make sure you have write access to ${S3_BUCKET}

