FROM    mongo:3.4

ENTRYPOINT []
ENV     MONGO_SERVER=mongodb \
        PREFIX=backup/mongo \
        SUPERCRONIC_VERSION=0.1.5


ADD     https://github.com/aptible/supercronic/releases/download/v${SUPERCRONIC_VERSION}/supercronic-linux-amd64 /bin/supercronic


RUN     apt-get update && \
        apt-get install -y --no-install-recommends \
        awscli && \
        chmod +x /bin/supercronic && \
        rm -rf /entrypoint.sh \
        /usr/local/bin/docker-entrypoint.sh \
        /docker-entrypoint-initdb.d \
        /var/lib/apt/lists/*

COPY    cmd.sh      /cmd.sh
COPY    backup.sh   /backup.sh
CMD     ["/cmd.sh"]