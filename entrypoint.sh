#!/bin/bash

set -euo pipefail


case $(echo ${CRON} | tr 'A-Z' 'a-z') in
hourly)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.hourly/backup_mongo
  cron -f
  ;;
daily)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.daily/backup_mongo
  cron -f
  ;;
weekly)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.weekly/backup_mongo
  cron -f
  ;;
*)
  echo "Executing one time backup"
  /backup.sh
  ;;
esac

