
ARG BUILD_FROM=redis:alpine

FROM $BUILD_FROM
ARG DEBIAN_FRONTEND=noninteractive
ARG REDIS_SOCKET=/var/run/sockets/redis.sock
ARG REDIS_UID=777
ENV REDIS_SOCKET=$REDIS_SOCKET \
    REDIS_UID=$REDIS_UID

COPY ./redis-entrypoint.sh /usr/local/bin/redis-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/redis-entrypoint.sh"]
CMD ["redis-server", "--port", "0", "--bind", "127.0.0.1", "--unixsocket"]

HEALTHCHECK --interval=10s --timeout=1s --retries=5 \
	CMD redis-cli -s $REDIS_SOCKET ping | grep PONG
