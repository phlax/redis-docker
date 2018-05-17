
ARG BUILD_FROM=redis:alpine

FROM $BUILD_FROM
ARG REDIS_SOCKET=/redis/socket/redis.sock
ARG DEBIAN_FRONTEND=noninteractive
ENV REDIS_SOCKET=$REDIS_SOCKET

COPY ./redis-entrypoint.sh /usr/local/bin/redis-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/redis-entrypoint.sh"]
CMD ["redis-server", "--port", "0", "--bind", "127.0.0.1", "--unixsocketperm", "777", "--unixsocket"]
