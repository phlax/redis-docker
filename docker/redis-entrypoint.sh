#!/bin/sh

# if the command ends with --unixsocket, then add $REDIS_SOCKET and uid
for last; do true; done
if [ $last = '--unixsocket' ]; then
    echo "Starting redis on socket: $REDIS_SOCKET"
    chown -R redis:redis `dirname $REDIS_SOCKET`
    exec docker-entrypoint.sh $@ $REDIS_SOCKET --unixsocketperm $REDIS_UID
else
    exec docker-entrypoint.sh $@
fi
