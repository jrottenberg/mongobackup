#!/bin/bash

set -euo pipefail

DATE=$(date +%Y%m%d_%H%M)
echo "Starting backup of ${MONGO_SERVER} to s3://${S3_BUCKET}/${PREFIX}/${DATE}"
mongodump --host "${MONGO_SERVER}"  --gzip --out=/var/backups/${DATE}

aws s3 cp --recursive /var/backups/${DATE} s3://${S3_BUCKET}/${PREFIX}/${DATE}

rm -rf /var/backups/${DATE}
echo "Completed backup of ${MONGO_SERVER} to s3://${S3_BUCKET}/${PREFIX}/${DATE}"
