#!/bin/bash

set -euo pipefail


case ${CRON} in
hourly)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.hourly/backup_mongo
  cron
  sleep infinity
  ;;
daily)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.daily/backup_mongo
  cron
  sleep infinity
  ;;
weekly)
  rm  /etc/cron.*/*
  mv /backup.sh /etc/cron.weekly/backup_mongo
  cron
  sleep infinity
  ;;
*)
  echo "Executing one time backup"
  /backup.sh
  ;;
esac

