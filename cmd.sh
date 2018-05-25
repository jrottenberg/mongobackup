#!/bin/bash

set -eo pipefail


case $(echo ${CRON} | tr 'A-Z' 'a-z') in
minutely)
  echo '* * * * *  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
hourly)
  /backup.sh
  echo '@hourly  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
daily)
  /backup.sh
  echo '@daily /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
weekly)
  /backup.sh
  echo '@weekly  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
*)
  /backup.sh
  ;;
esac

