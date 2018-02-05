#!/bin/bash

set -eo pipefail


case $(echo ${CRON} | tr 'A-Z' 'a-z') in
minutely)
  echo '* * * * *  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
hourly)
  echo '@hourly  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
daily)
  echo '@daily /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
weekly)
  echo '@weekly  /backup.sh' > /crontab
  supercronic -json /crontab
  ;;
*)
  /backup.sh
  ;;
esac

