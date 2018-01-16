# Mongo backup


## Operations
Two modes of operation

### Crond

Run as a deployment, crond inside the container will initiates the backup

choose CRON=hourly|daily|weekly

### Standalone
Run as a job trigger , execute /backup.sh directly



## Environment variables

MONGO_SERVER=mongodb
SUFFIX=backup/mongo
S3_BUCKET

CRON=hourly|daily|weekly (or not set to run standalone command)

