FROM    mongo:3.2

ENTRYPOINT []
ENV     MONGO_SERVER=mongodb \
        SUFFIX=backup/mongo
CMD     ['/entrypoint.sh']

RUN     apt-get update && \
        apt-get install -y --no-install-recommends \
		awscli \
        cron && \
        rm -rf /entrypoint.sh \
               /usr/local/bin/docker-entrypoint.sh \
               /var/lib/apt/lists/*


COPY    entrypoint.sh /entrypoint.sh
COPY    backup.sh   /backup.sh

