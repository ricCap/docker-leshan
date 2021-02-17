#!/bin/sh

SERVICE=server
if [ -n "$1" ] && [ "$1" != "--" ]; then
    SERVICE="$1"
    shift
fi

if [ "$1" = "--" ]; then
    shift
fi

ls
ls /opt/leshan

set -xe

case $SERVICE in
  server)
    java -jar ./leshan-server-demo-0.1.11-M14-jar-with-dependencies.jar "$@" ;;
  bootstrap|bsserver)
    java -jar ./leshan-bsserver-demo-0.1.11-M14-jar-with-dependencies.jar "$@" ;;
  *)
    echo "Usage: <server|bootstrap>"
    exit 1
esac
