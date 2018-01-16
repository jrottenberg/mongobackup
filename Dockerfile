FROM    mongo:3.2

ENV     MONGO_SERVER=mongodb \
        SUFFIX=backup/mongo
CMD     ['/entrypoint.sh']

RUN     apt-get update && \
        apt-get install -y --no-install-recommends \
		awscli \
        cron

COPY    entrypoint.sh /entrypoint.sh
COPY    backup.sh     /backup.sh

ENTRYPOINT []