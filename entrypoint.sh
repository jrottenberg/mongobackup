#!/bin/bash

set -euo pipefail

rm  /etc/cron.*/*
cp /etc/crontab /etc/cron.d/

case $(echo ${CRON} | tr 'A-Z' 'a-z') in
hourly)
  mv /backup.sh /etc/cron.hourly/backup_mongo
  cron -f
  ;;
daily)
  mv /backup.sh /etc/cron.daily/backup_mongo
  cron -f
  ;;
weekly)
  mv /backup.sh /etc/cron.weekly/backup_mongo
  cron -f
  ;;
*)
  echo "Executing one time backup"
  /backup.sh
  ;;
esac

