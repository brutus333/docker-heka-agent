#!/bin/sh
set -e

# ensure the following environment variables are set. exit script and container if not set.
test $KAFKA_SERVERS || { echo "ERR: Variable KAFKA_SERVERS is missing"; sleep 20; exit 1; }
test $KAFKA_TOPIC || { echo "ERR: Variable KAFKA_TOPIC is missing"; sleep 20; exit 1; }

/bin/confd -onetime -backend env

/usr/bin/hekad -config /etc/heka
