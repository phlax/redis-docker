#!/bin/sh

echo "Starting redis on socket: $REDIS_SOCKET"
chown -R redis:redis `dirname $REDIS_SOCKET`

# if the command ends with --unixsocket, then add $REDIS_SOCKET
for last; do true; done
if [ $last = '--unixsocket' ]; then
    exec docker-entrypoint.sh $@ $REDIS_SOCKET
else
    exec docker-entrypoint.sh $@
fi
